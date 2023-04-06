
# If you want a specific version of the node_exporter, set it here, you can see the list at https://github.com/prometheus/node_exporter/releases
PACKAGE_NAME="node_exporter-0.16.0.linux-amd64"

# Fetching the archive
curl -L https://github.com/prometheus/node_exporter/releases/download/v0.16.0/$PACKAGE_NAME.tar.gz -o $PACKAGE_NAME.tar.gz

# Extracting the archive
tar xzvf $PACKAGE_NAME.tar.gz

# Moving the executable to /usr/bin
sudo cp ./$PACKAGE_NAME/node_exporter /usr/bin

# Marking it as executable
sudo chmod +x /usr/bin/node_exporter

# Copying the systemd unit file
sudo cp ./node_exporter.service /etc/systemd/system

# Reloading systemd
sudo systemctl daemon-reload

# Enabling the service
sudo systemctl enable node_exporter

# Running the service
sudo systemctl start node_exporter

echo "finish intalling"