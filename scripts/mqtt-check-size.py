import logging
import os

import dotenv
import paho.mqtt.client as mqtt

dotenv.load_dotenv()
logging.basicConfig(level=logging.DEBUG, format=os.getenv("LOG_FORMAT"))


def publish_to_mqtt(
    topic: str,
    broker: str = "localhost",
    port: int = 1883,
    message: str = "",
    retain: bool = False,
):
    """
    Publish the configuration for the Home Assistant sensor.

    Args:
        topic (str): MQTT topic to publish the configuration to.
        broker (str): Address of the MQTT broker (default is 'localhost').
        port (int): Port of the MQTT broker (default is 1883).
        sensor_config (dict): Configuration for the Home Assistant sensor.
    """
    mqtt_username = os.getenv("MQTT_USER")
    mqtt_password = os.getenv("MQTT_PASSWORD")

    client = mqtt.Client()
    client.username_pw_set(mqtt_username, mqtt_password)
    client.connect(broker, port, 60)
    client.publish(topic, message, qos=1, retain=retain)
    client.disconnect()
    logging.info(f"Configuration published to topic '{topic}'")


def get_folder_size(folder_path: str) -> int:
    """
    Calculate the total size of a folder and its subfolders.

    Args:
        folder_path (str): Path to the folder.

    Returns:
        int: Total size of the folder in bytes.
    """
    return sum(
        os.path.getsize(os.path.join(dirpath, file))
        for dirpath, _, filenames in os.walk(folder_path)
        for file in filenames
        if os.path.isfile(os.path.join(dirpath, file))
    )


def check_size():
    path = os.getenv("PATH_NAS")
    folders = os.getenv("FOLDERS_PATH")
    broker_address = os.getenv("BROKER")

    folders = list(folders.split(","))

    for folder in folders:
        if folder == "total":
            folder_path = path
        else:
            folder_path = f"{path}/{folder}"

        mqtt_topic = f"folder_size/{folder}/state"
        config_topic = f"homeassistant/sensor/folder_size/{folder}/config"
        port = 1883
        sensor_config = os.getenv("MQTT_CONFIG_TOPIC")

        # Publish the sensor configuration.
        publish_to_mqtt(
            topic=config_topic,
            message=str(sensor_config).replace("{folder}", folder),
            broker=broker_address,
            port=port,
            retain=True,
        )
        logging.info(f"Config created for {folder}")

        if os.path.isdir(folder_path):
            folder_size = get_folder_size(folder_path)
            logging.info(f"Total folder size '{folder_path}':{folder_size}")
            publish_to_mqtt(
                topic=mqtt_topic,
                message=str(folder_size),
                broker=broker_address,
                port=port,
            )
            logging.info(f"Folder size published to MQTT topic '{mqtt_topic}'")
        else:
            raise ValueError("The provided path is not a valid folder.")


if __name__ == "__main__":
    check_size()
