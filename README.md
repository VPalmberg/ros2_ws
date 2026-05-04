<a name="readme-top"></a>

[![ROS2][ros2-shield]][ros2-url]
[![Python][python-shield]][python-url]
[![Docker][docker-shield]][docker-url]
[![License: MIT][license-shield]][license-url]

---

🇬🇧 [English](#english) · 🇪🇪 [Eesti](#eesti)

---

<br />
<div align="center">
  <h2>MET0310 Autonoomsed sõidukid</h2>
  <h3>ROS2 Practical Assignments</h3>
  <p>
    Vladlen Palmberg &nbsp;|&nbsp; 232964EARB
    <br />
    <a href="https://github.com/VPalmberg/ros2_ws"><strong>View Repository »</strong></a>
  </p>
</div>

---

<a name="english"></a>

# 🇬🇧 English

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-en">About the Project</a></li>
    <li><a href="#built-with-en">Built With</a></li>
    <li><a href="#getting-started-en">Getting Started</a></li>
    <li><a href="#p1-mapping-en">P1 — Mapping</a></li>
    <li><a href="#p2-navigation-en">P2 — Autonomous Navigation</a></li>
    <li><a href="#p3-autoware-en">P3 — Autoware AV Navigation</a></li>
    <li><a href="#p4-validation-en">P4 — AV Validation (upcoming)</a></li>
    <li><a href="#structure-en">Project Structure</a></li>
    <li><a href="#contact-en">Contact</a></li>
  </ol>
</details>

---

<a name="about-en"></a>
## About the Project

This repository contains ROS2 practical assignments for the course **MET0310 Autonoomsed sõidukid** (Autonomous Vehicles). Each assignment builds on the previous one, progressing from basic mapping to full autonomous vehicle validation.

| # | Topic | Status |
|---|-------|--------|
| P1 | Mapping | ✅ Done |
| P2 | Autonomous Navigation | ✅ Done |
| P3 | Autoware AV Navigation | ✅ Done |
| P4 | AV Validation — Scenario Simulation | 🔜 Upcoming |

All ROS2 work runs inside a Docker container using **ROS2 Humble** on Ubuntu 22.04.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<a name="built-with-en"></a>
## Built With

* [![ROS2][ros2-shield]][ros2-url] Humble
* [![Python][python-shield]][python-url] 3.10
* [![Docker][docker-shield]][docker-url]
* **TurtleBot3 Burger** (P1, P2)
* **Gazebo** — robot simulation
* **Cartographer** — SLAM mapping (P1)
* **Nav2** — autonomous navigation stack (P2)
* **Autoware** — full AV stack (P3, P4)
* **Autoware Scenario Simulator V2** (P4)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<a name="getting-started-en"></a>
## Getting Started

### Prerequisites

- Docker installed and running
- TurtleBot3 Docker image (for P1, P2):
  ```sh
  docker pull ros:humble
  ```
- Autoware Docker image (for P3, P4) — see [Autoware documentation](https://autowarefoundation.github.io/autoware-documentation/)

### Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/VPalmberg/ros2_ws.git
   cd ros2_ws
   ```

2. Start the Docker container:
   ```sh
   ./docker_terminal.sh
   ```

3. Inside the container, build the workspace:
   ```sh
   cd ~/ws
   ./build_ws.sh
   source install/setup.bash
   ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<a name="p1-mapping-en"></a>
## P1 — Mapping Your Custom Environment

### Goal

Design a custom Gazebo simulation environment and use Cartographer SLAM to autonomously generate an accurate map. The robot navigates the environment using LiDAR data to avoid obstacles while mapping.

### How It Works

- A custom ROS2 node (`mapping.py`) subscribes to `/scan` (LaserScan) and publishes velocity commands to `/cmd_vel`
- The robot uses LiDAR readings in three directions (front, left, right) to decide when to turn
- Cartographer SLAM builds a 2D occupancy grid map in real time
- The finished map is saved to the `map/` folder

### Launch — One Command

```sh
ros2 launch my_robot_controller mapping.launch.py
```

This starts Gazebo, Cartographer, and the autonomous mapping node simultaneously.

### Save the Map

```sh
ros2 run nav2_map_server map_saver_cli -f ~/ws/src/my_robot_controller/map/map
```

### Key Files

| File | Description |
|------|-------------|
| `launch/mapping.launch.py` | Single launch: Gazebo + Cartographer + mapping node |
| `my_robot_controller/mapping.py` | Autonomous mapping node (LiDAR-based obstacle avoidance) |
| `map/map.pgm` / `map/map.yaml` | Saved map files |

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<a name="p2-navigation-en"></a>
## P2 — Autonomous Navigation in Your Custom Map

### Goal

Enable TurtleBot3 to navigate autonomously through a sequence of predefined goal locations using the Nav2 navigation stack, without any manual intervention.

### How It Works

- A custom ROS2 node (`navigation.py`) publishes the initial pose to `/initialpose` and sequentially sends goal poses to `/goal_pose`
- The robot's position is monitored via `/odom` (Odometry)
- When the robot comes within 0.5 m of the current goal, the next goal is automatically sent
- 4 goals are defined with (x, y, yaw) coordinates in the custom map

### Launch — One Command

```sh
ros2 launch my_robot_controller run_navigation.launch.py
```

This starts Gazebo, Nav2 with the saved map, and the autonomous navigation node simultaneously.

### Goal Sequence

| # | x | y | yaw (°) |
|---|---|---|---------|
| 1 | 1.099 | -2.735 | 10.4 |
| 2 | 8.859 | -1.838 | 100.5 |
| 3 | 10.862 | -2.308 | 77.0 |
| 4 | 5.139 | -0.205 | 168.2 |

### Key Files

| File | Description |
|------|-------------|
| `launch/run_navigation.launch.py` | Single launch: Gazebo + Nav2 + navigation node |
| `my_robot_controller/navigation.py` | Sequential goal navigation node |
| `src/MAIN_MAP/MAIN_MAP.yaml` | Map used for navigation |

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<a name="p3-autoware-en"></a>
## P3 — Autonomous Navigation of Ego Vehicle Using Autoware

### Goal

Use the full Autoware autonomous driving stack to navigate an ego vehicle through a sequence of goal destinations, automating the entire mission planning process via a custom ROS2 node.

### How It Works

- A custom ROS2 node (`av_navigation.py`) publishes the initial pose to `/initialpose` and goal destinations to `/planning/mission_planning/goal`
- Vehicle position is monitored via `/localization/kinematic_state` (Odometry)
- When the vehicle reaches a goal (within 5 m), the next goal is sent automatically
- The node calls the `/system/operation_mode/change_operation_mode` service to switch Autoware into autonomous mode

### Launch

```sh
ros2 launch my_robot_controller car_nav.launch.py
```

### ROS2 Topics Used

| Topic | Type | Direction |
|-------|------|-----------|
| `/initialpose` | `PoseWithCovarianceStamped` | Publish |
| `/planning/mission_planning/goal` | `PoseStamped` | Publish |
| `/localization/kinematic_state` | `Odometry` | Subscribe |
| `/system/operation_mode/change_operation_mode` | Service | Call |

### Key Files

| File | Description |
|------|-------------|
| `launch/car_nav.launch.py` | Autoware + custom navigation node launch |
| `my_robot_controller/av_navigation.py` | Autoware mission planning node |

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<a name="p4-validation-en"></a>
## P4 — AV Validation: Scenario Simulation *(upcoming)*

### Goal

Design and simulate an interactive traffic scenario using **Autoware Scenario Simulator V2** to validate autonomous vehicle behavior in dynamic environments with other traffic participants.

### Planned Implementation

- Create a scenario in the online scenario editor:
  - Import a Lanelet2 map
  - Add at least 2 NPCs (vehicles or pedestrians)
  - Define realistic NPC interactions (yielding, crossing, merging)
- Export and modify the scenario YAML file (OpenScenario format)
- Run the simulation using the pre-configured Autoware Docker environment
- Analyze results: check for collisions, rule violations, scenario completion

### Tools

| Tool | Purpose |
|------|---------|
| Autoware Scenario Simulator V2 | Scenario execution engine |
| Online Scenario Editor | Visual scenario authoring |
| Lanelet2 | Map format for road network |
| Docker | Pre-configured Autoware environment |

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<a name="structure-en"></a>
## Project Structure

```
ros2_ws/
├── build_ws.sh                          # Build script (colcon, with /tmp fallback)
├── docker_terminal.sh                   # Launch Docker container
└── src/
    ├── MAIN_MAP/
    │   ├── MAIN_MAP.pgm                 # Navigation map (P2)
    │   └── MAIN_MAP.yaml
    └── my_robot_controller/
        ├── launch/
        │   ├── mapping.launch.py        # P1 — Gazebo + Cartographer + mapping node
        │   ├── run_navigation.launch.py # P2 — Gazebo + Nav2 + navigation node
        │   └── car_nav.launch.py        # P3 — Autoware + AV navigation node
        ├── map/
        │   ├── map.pgm                  # P1 generated map
        │   └── map.yaml
        └── my_robot_controller/
            ├── mapping.py               # P1 — LiDAR-based autonomous mapping
            ├── navigation.py            # P2 — Sequential goal navigation (Nav2)
            └── av_navigation.py         # P3 — Autoware mission planning node
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---

<a name="contact-en"></a>
## Contact

**Vladlen Palmberg** — palmberg.vladlen@gmail.com

Repository: [https://github.com/VPalmberg/ros2_ws](https://github.com/VPalmberg/ros2_ws)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

---
---

<a name="eesti"></a>

# 🇪🇪 Eesti

<details>
  <summary>Sisukord</summary>
  <ol>
    <li><a href="#projektist-ee">Projektist</a></li>
    <li><a href="#tehnoloogiad-ee">Kasutatud tehnoloogiad</a></li>
    <li><a href="#alustamine-ee">Alustamine</a></li>
    <li><a href="#p1-kaardistamine-ee">P1 — Kaardistamine</a></li>
    <li><a href="#p2-navigatsioon-ee">P2 — Autonoomne navigatsioon</a></li>
    <li><a href="#p3-autoware-ee">P3 — Autoware AV navigatsioon</a></li>
    <li><a href="#p4-valideerimine-ee">P4 — AV valideerimine (tulemas)</a></li>
    <li><a href="#struktuur-ee">Projekti struktuur</a></li>
    <li><a href="#kontakt-ee">Kontakt</a></li>
  </ol>
</details>

---

<a name="projektist-ee"></a>
## Projektist

See repositoorium sisaldab ROS2 praktilisi ülesandeid kursuse **MET0310 Autonoomsed sõidukid** raames. Iga ülesanne ehitab eelmisele, alustades lihtsast kaardistamisest kuni täieliku autonoomse sõiduki valideerimiseni.

| # | Teema | Staatus |
|---|-------|---------|
| P1 | Kaardistamine | ✅ Tehtud |
| P2 | Autonoomne navigatsioon | ✅ Tehtud |
| P3 | Autoware AV navigatsioon | ✅ Tehtud |
| P4 | AV valideerimine — stsenaariumi simuleerimine | 🔜 Tulemas |

Kogu ROS2 töö jookseb Docker konteineris kasutades **ROS2 Humble** Ubuntu 22.04 peal.

<p align="right">(<a href="#readme-top">tagasi üles</a>)</p>

---

<a name="tehnoloogiad-ee"></a>
## Kasutatud tehnoloogiad

* [![ROS2][ros2-shield]][ros2-url] Humble
* [![Python][python-shield]][python-url] 3.10
* [![Docker][docker-shield]][docker-url]
* **TurtleBot3 Burger** (P1, P2)
* **Gazebo** — roboti simulatsioon
* **Cartographer** — SLAM kaardistamine (P1)
* **Nav2** — autonoomse navigatsiooni raamistik (P2)
* **Autoware** — täielik AV tarkvararaamistik (P3, P4)
* **Autoware Scenario Simulator V2** (P4)

<p align="right">(<a href="#readme-top">tagasi üles</a>)</p>

---

<a name="alustamine-ee"></a>
## Alustamine

### Eeldused

- Docker on paigaldatud ja töötab
- TurtleBot3 Docker image (P1, P2 jaoks):
  ```sh
  docker pull ros:humble
  ```
- Autoware Docker image (P3, P4 jaoks) — vaata [Autoware dokumentatsiooni](https://autowarefoundation.github.io/autoware-documentation/)

### Paigaldamine

1. Klooni repositoorium:
   ```sh
   git clone https://github.com/VPalmberg/ros2_ws.git
   cd ros2_ws
   ```

2. Käivita Docker konteiner:
   ```sh
   ./docker_terminal.sh
   ```

3. Konteineri sees ehita tööruum:
   ```sh
   cd ~/ws
   ./build_ws.sh
   source install/setup.bash
   ```

<p align="right">(<a href="#readme-top">tagasi üles</a>)</p>

---

<a name="p1-kaardistamine-ee"></a>
## P1 — Kohandatud keskkonna kaardistamine

### Eesmärk

Luua kohandatud Gazebo simulatsioonikeskkond ja kasutada Cartographer SLAM-i autonoomselt täpse kaardi genereerimiseks. Robot liigub LiDAR-andmeid kasutades takistustest mööda.

### Kuidas töötab

- Kohandatud ROS2 sõlm (`mapping.py`) tellib `/scan` (LaserScan) ja avaldab kiirusekäske `/cmd_vel` kanalisse
- Robot kasutab LiDAR-lugemeid kolmes suunas (ees, vasakul, paremal) pöördeotsuste tegemiseks
- Cartographer SLAM ehitab reaalajas 2D kaardi
- Valmis kaart salvestatakse kausta `map/`

### Käivitamine — ühe käsuga

```sh
ros2 launch my_robot_controller mapping.launch.py
```

See käivitab korraga Gazebo, Cartographeri ja autonoomse kaardistamise sõlme.

### Kaardi salvestamine

```sh
ros2 run nav2_map_server map_saver_cli -f ~/ws/src/my_robot_controller/map/map
```

### Peamised failid

| Fail | Kirjeldus |
|------|-----------|
| `launch/mapping.launch.py` | Ühekordne käivitus: Gazebo + Cartographer + kaardistamise sõlm |
| `my_robot_controller/mapping.py` | Autonoomse kaardistamise sõlm (LiDAR-põhine takistuste vältimine) |
| `map/map.pgm` / `map/map.yaml` | Salvestatud kaardifailid |

<p align="right">(<a href="#readme-top">tagasi üles</a>)</p>

---

<a name="p2-navigatsioon-ee"></a>
## P2 — Autonoomne navigatsioon kohandatud kaardil

### Eesmärk

Võimaldada TurtleBot3-l navigeerida autonoomselt läbi eelnevalt määratud eesmärkide jada Nav2 navigatsioonipinu abil, ilma igasuguse käsitsi sekkumiseta.

### Kuidas töötab

- Kohandatud ROS2 sõlm (`navigation.py`) avaldab algasendi `/initialpose` kanalisse ja saadab järjestikku eesmärgid `/goal_pose` kanalisse
- Roboti asukohta jälgitakse `/odom` (Odometry) kaudu
- Kui robot on praegusest eesmärgist 0,5 m kaugusel, saadetakse automaatselt järgmine eesmärk
- Määratud on 4 eesmärki (x, y, yaw) koordinaatidega kohandatud kaardil

### Käivitamine — ühe käsuga

```sh
ros2 launch my_robot_controller run_navigation.launch.py
```

See käivitab korraga Gazebo, Nav2 salvestatud kaardiga ja autonoomse navigatsioonisõlme.

### Eesmärkide järjestus

| # | x | y | yaw (°) |
|---|---|---|---------|
| 1 | 1.099 | -2.735 | 10.4 |
| 2 | 8.859 | -1.838 | 100.5 |
| 3 | 10.862 | -2.308 | 77.0 |
| 4 | 5.139 | -0.205 | 168.2 |

### Peamised failid

| Fail | Kirjeldus |
|------|-----------|
| `launch/run_navigation.launch.py` | Ühekordne käivitus: Gazebo + Nav2 + navigatsioonisõlm |
| `my_robot_controller/navigation.py` | Järjestikuse eesmärgi navigatsioonisõlm |
| `src/MAIN_MAP/MAIN_MAP.yaml` | Navigatsiooniks kasutatav kaart |

<p align="right">(<a href="#readme-top">tagasi üles</a>)</p>

---

<a name="p3-autoware-ee"></a>
## P3 — Ego-sõiduki autonoomne navigatsioon Autoware'iga

### Eesmärk

Kasutada täielikku Autoware autonoomse juhtimise raamistikku ego-sõiduki navigeerimiseks läbi eesmärkide jada, automatiseerides missioonide planeerimise kohandatud ROS2 sõlme abil.

### Kuidas töötab

- Kohandatud ROS2 sõlm (`av_navigation.py`) avaldab algasendi `/initialpose` ja eesmärgid `/planning/mission_planning/goal` kanalisse
- Sõiduki asukohta jälgitakse `/localization/kinematic_state` (Odometry) kaudu
- Kui sõiduk jõuab eesmärgini (5 m piires), saadetakse automaatselt järgmine eesmärk
- Sõlm kutsub teenust `/system/operation_mode/change_operation_mode`, et lülitada Autoware autonoomsesse režiimi

### Käivitamine

```sh
ros2 launch my_robot_controller car_nav.launch.py
```

### Kasutatud ROS2 teemad

| Teema | Tüüp | Suund |
|-------|------|-------|
| `/initialpose` | `PoseWithCovarianceStamped` | Avalda |
| `/planning/mission_planning/goal` | `PoseStamped` | Avalda |
| `/localization/kinematic_state` | `Odometry` | Telli |
| `/system/operation_mode/change_operation_mode` | Teenus | Kutsu |

### Peamised failid

| Fail | Kirjeldus |
|------|-----------|
| `launch/car_nav.launch.py` | Autoware + kohandatud navigatsioonisõlme käivitus |
| `my_robot_controller/av_navigation.py` | Autoware missioonide planeerimise sõlm |

<p align="right">(<a href="#readme-top">tagasi üles</a>)</p>

---

<a name="p4-valideerimine-ee"></a>
## P4 — AV valideerimine: stsenaariumi simuleerimine *(tulemas)*

### Eesmärk

Kujundada ja simuleerida interaktiivne liiklusstsenaariumid kasutades **Autoware Scenario Simulator V2**, et valideerida autonoomse sõiduki käitumist dünaamilistes keskkondades teiste liiklejatega.

### Planeeritud teostus

- Luua stsenaarium veebipõhises redaktoris:
  - Importida Lanelet2 kaart
  - Lisada vähemalt 2 NPC-d (sõidukid või jalakäijad)
  - Määratleda realistlikud NPC interaktsioonid (tee andmine, ületus, ühinemine)
- Eksportida ja muuta stsenaariumi YAML-faili (OpenScenario formaat)
- Käivitada simulatsioon eelkonfigureeritud Autoware Docker keskkonnas
- Analüüsida tulemusi: kontrollida kokkupõrkeid, reeglite rikkumisi, stsenaariumi lõpetamist

### Tööriistad

| Tööriist | Eesmärk |
|----------|---------|
| Autoware Scenario Simulator V2 | Stsenaariumi täitmise mootor |
| Veebipõhine stsenaariumiredaktor | Visuaalne stsenaariumide loomine |
| Lanelet2 | Teedevõrgu kaardi formaat |
| Docker | Eelkonfigureeritud Autoware keskkond |

<p align="right">(<a href="#readme-top">tagasi üles</a>)</p>

---

<a name="struktuur-ee"></a>
## Projekti struktuur

```
ros2_ws/
├── build_ws.sh                          # Ehitusskript (colcon, /tmp varulahendusega)
├── docker_terminal.sh                   # Docker konteineri käivitamine
└── src/
    ├── MAIN_MAP/
    │   ├── MAIN_MAP.pgm                 # Navigatsioonikaart (P2)
    │   └── MAIN_MAP.yaml
    └── my_robot_controller/
        ├── launch/
        │   ├── mapping.launch.py        # P1 — Gazebo + Cartographer + kaardistamise sõlm
        │   ├── run_navigation.launch.py # P2 — Gazebo + Nav2 + navigatsioonisõlm
        │   └── car_nav.launch.py        # P3 — Autoware + AV navigatsioonisõlm
        ├── map/
        │   ├── map.pgm                  # P1 genereeritud kaart
        │   └── map.yaml
        └── my_robot_controller/
            ├── mapping.py               # P1 — LiDAR-põhine autonoomne kaardistamine
            ├── navigation.py            # P2 — Järjestikuse eesmärgi navigatsioon (Nav2)
            └── av_navigation.py         # P3 — Autoware missioonide planeerimise sõlm
```

<p align="right">(<a href="#readme-top">tagasi üles</a>)</p>

---

<a name="kontakt-ee"></a>
## Kontakt

**Vladlen Palmberg** — palmberg.vladlen@gmail.com

Repositoorium: [https://github.com/VPalmberg/ros2_ws](https://github.com/VPalmberg/ros2_ws)

<p align="right">(<a href="#readme-top">tagasi üles</a>)</p>

---

<!-- MARKDOWN LINKS & IMAGES -->
[ros2-shield]: https://img.shields.io/badge/ROS2-Humble-blue?style=for-the-badge&logo=ros&logoColor=white
[ros2-url]: https://docs.ros.org/en/humble/
[python-shield]: https://img.shields.io/badge/Python-3.10-3776AB?style=for-the-badge&logo=python&logoColor=white
[python-url]: https://www.python.org/
[docker-shield]: https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white
[docker-url]: https://www.docker.com/
[license-shield]: https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge
[license-url]: https://opensource.org/licenses/MIT
