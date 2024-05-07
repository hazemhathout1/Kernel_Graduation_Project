#!/bin/bash

pcap_file="smallFlows.pcap"



# Use tshark to count total packets
total_packet_count=$(tshark -r "$pcap_file" | wc -l)

# Use tshark to filter HTTP packets and count the occurrences
http_packet_count=$(tshark -r "$pcap_file" -Y "http" | grep -c "HTTP")

# Calculate the count of non-HTTP packets
non_http_packet_count=$((total_packet_count - http_packet_count))



source_ip_counts=$(tshark -r "$pcap_file" -T fields -e ip.src | sort | uniq -c | sort -nr | head -n 5)
source_packet_counts=$(echo "$source_ip_counts" | awk '{print $1}')
source_ip_addresses=$(echo "$source_ip_counts" | awk '{print $2}')


destin_ip_counts=$(tshark -r "$pcap_file" -T fields -e ip.dst | sort | uniq -c | sort -nr | head -n 5)
destin_packet_counts=$(echo "$destin_ip_counts" | awk '{print $1}')
destin_ip_adresses=$(echo "$destin_ip_counts" | awk '{print $2}')



# sorting arrays to put all the ip and count of each
source_packet_counts=()
source_ip_addresses=()
while read -r count ip; do
    source_packet_counts+=("$count")
    source_ip_addresses+=("$ip")
done <<< "$source_ip_counts"

destin_packet_counts=()
destin_ip_adresses=()
while read -r count ip; do
    destin_packet_counts+=("$count")
    destin_ip_adresses+=("$ip")
done <<< "$destin_ip_counts"






# Function to extract information from the pcap file
analyze_traffic() {
    # Use tshark or similar commands for packet analysis.
    # Hint: Consider commands to count total packets, filter by protocols (HTTP, HTTPS/TLS),
    # extract IP addresses, and generate summary statistics.

    # Output analysis summary
    echo "----- Network Traffic Analysis Report -----"
    # Provide summary information based on your analysis
    # Hints: Total packets, protocols, top source, and destination IP addresses.
    echo "1. Total Packets: ${total_packet_count}"
    echo "2. Protocols:"
    echo "   - HTTP: $http_packet_count packets"
    echo "   - HTTPS/TLS: $non_http_packet_count packets"
    echo ""
    echo "3. Top 5 Source IP Addresses:"
    # Provide the top source IP addresses
    for ((i = 0; i < 5; i++)); do
        echo "IP Address: ${source_ip_addresses[$i]}, Packet Count: ${source_packet_counts[$i]} Packets"
    done
    echo ""
    echo "4. Top 5 Destination IP Addresses:"
    # Provide the top destination IP addresses
    #echo "Top 5 Destin IP Addresses and Packet Counts:"
    for ((i = 0; i < 5; i++)); do
        echo "IP Address: ${destin_ip_adresses[$i]}, Packet Count: ${destin_packet_counts[$i]} Packets"
    done
    echo ""
    echo "----- End of Report -----"
}

# Run the analysis function
analyze_traffic