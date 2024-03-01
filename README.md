# simulated-network-topology
# FIB (Forward Information Base)

Created by: Raihan Islam <br>
Created time: March 2, 2024 12:04 AM

## *How FIB network architecture generally works:*

1. **FIB Overview:**
    - The Forwarding Information Base (FIB) is a table used by routers to determine packet forwarding.
    - It contains mappings of destination network addresses to the next-hop router or interface.
2. **Populating the FIB:**
    - FIB entries are populated through routing protocols such as OSPF, RIP, and BGP.
    - These protocols exchange routing information among routers to build and update the FIB.
3. **Forwarding Decisions:**
    - When a router receives an incoming packet, it examines the destination IP address.
    - The router looks up the destination address in its FIB.
    - If a matching entry is found in the FIB, the router forwards the packet based on the next-hop information specified in the FIB entry.
    - If no matching entry is found, the router typically either drops the packet or forwards it to a default route if configured.
    
## *Proposed network topology:*
    
![topology](https://github.com/Raihan-009/simulated-network-topology/blob/main/topology.png?raw=true)
    
## *How the FIB works in our environment:*
    
**1. Router Configuration**:

- In our setup, the **`router`** namespace is acting as a router between the **`red`** and **`blue`** namespaces.
- The router's FIB contains information about the next-hop IP addresses for each destination network.
- When a packet arrives at the router, it consults its FIB to determine the next-hop interface and IP address for the packet.

1. **Routing Table**:
    - The routing table in the **`router`** namespace contains the routing information used to populate the FIB.
    - Entries in the routing table specify the destination network (e.g., **`10.11.0.0/24`** for the **`red`** namespace and **`10.12.0.0/24`** for the **`blue`** namespace) and the next-hop IP address for each network.
    - The router uses this routing table to populate its FIB with the necessary forwarding information.
    
    *Mac Address table:*
    
    ![Arp Table](https://github.com/Raihan-009/simulated-network-topology/blob/main/arp-table.png?raw=true)
    
    *Routing table:*
    
    ![Routing Table](https://github.com/Raihan-009/simulated-network-topology/blob/main/routing-table.png?raw=true)
    
2. **Packet Forwarding**:
    - When a packet arrives at the router, it performs a lookup in its FIB to determine the next-hop interface and IP address for the packet's destination.
    - Based on the information in the FIB, the router forwards the packet to the appropriate interface.
    - If the packet's destination is within the same network (e.g., from **`red`** to **`router`**), the router forwards the packet directly to the destination host without further routing.
    
    *Connectivity:*
    
    ![Connectivity](https://github.com/Raihan-009/simulated-network-topology/blob/main/connectivity.png?raw=true)