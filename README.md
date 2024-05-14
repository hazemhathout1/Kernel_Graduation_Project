# Network Traffic Analysis Script

## Overview

This Bash script is designed to analyze network traffic captured in a pcap file. It utilizes the `tshark` command-line tool for packet analysis and data extraction. The script provides various insights into the network traffic, including total packet counts, categorization into HTTP and non-HTTP packets, and identification of the top source and destination IP addresses along with packet counts for each.

## Features

- Counts total packets and categorizes them into HTTP and non-HTTP packets.
- Identifies the top 5 source and destination IP addresses along with packet counts for each.
- Provides a summary report of the network traffic analysis.

## Usage

1. Ensure you have `tshark` installed on your system. If not, you can install it via the Wireshark package.

2. Download or clone the script to your local machine.

3. Provide the path to your pcap file in the `pcap_file` variable within the script.

4. Run the script using the Bash shell:

    ```
    ./analyze_traffic.sh
    ```

5. The script will generate a report displaying the analysis results, including total packets, protocols, and top source/destination IP addresses.

## Requirements

- Bash shell
- `tshark` command-line tool (part of the Wireshark package)

## Example

```bash
# Specify the pcap file
pcap_file="your_pcap_file.pcap"

# Run the script
./analyze_traffic.sh
