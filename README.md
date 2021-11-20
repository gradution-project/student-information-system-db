# <img src="https://bit.ly/3yP9D95" width="60" align="center"/> MySQL Database Installation Document

## Install MySQL Database

### [MySQL Community Server](https://dev.mysql.com/downloads/mysql/)

- [x] Packages for macOS Big Sur (macOS 11) on x86 are compatible with macOS Catalina (macOS 10.15)
- [x] MySQL Community Server Version `8.0.26` must be downloaded!

---

### For Windows (x86, 32-bit/64-bit)

#### [MySQL Community MSI Installer 8.0.26](https://downloads.mysql.com/archives/get/p/25/file/mysql-installer-community-8.0.26.0.msi)

---

### For macOS 11 (ARM, 64-bit)

#### [MySQL Community Server 8.0.26](https://downloads.mysql.com/archives/get/p/23/file/mysql-8.0.26-macos11-arm64.dmg)

---

### For macOS 11 (x86, 64-bit)

#### [MySQL Community Server 8.0.26](https://dev.mysql.com/get/Downloads/MySQL-8.0/mysql-8.0.26-macos11-x86_64.dmg)

### Installation

- Install MySQL Using MySQL Community Server Setup
- `root` user password must be `rootpass` when setup MySQL Community Server
- Visible in System Preferences when installed MySQL
- Can be Start and Stop MySQL from this screen

<img src="https://bit.ly/2YkNqTN" alt="drawing" width="500"/>

Creating the Database
----------------------
Connect to database with the following information:

````bash
User: root
Password: rootpass
URL: jdbc:mysql://localhost:3306
````

Then, open a new query console from system and execute `setup_scripts/setup_sis.sql` file.

If you need to run another databases then you need to execute their `setup.sql` file.

Updating the Database
----------------------
Commands must be run under mysql directory:

```shell
cd mysql
```

Run the following command to merge database changes:

```shell
./sis migrate
```

Should you need to clean everything and start from starch, issue the following command:

```shell
./sis clean migrate
```

If you are using Windows OS then you need to use these commands with syntax giving below:

```shell
sis migrate
```

```shell
sis clean migrate
```

TEST DB Connection Information
------------------------------------

- **Connection Type:** `URL Only`
- **JDBC URL:** `jdbc:mysql://yvu4xahse0smimsc.chr7pe7iynqr.eu-west-1.rds.amazonaws.com:3306/njeyua2hj634kcnf`

| Username         | Password         |
|:----------------:|------------------|
| g31ax340gn7k3vy9 | p4f2nkus8dhnpyfc |

- Click `Apply` and `OK`, if visible **Succeeded** information message when clicked `Test Connection` button.

MASTER DB Connection Information
------------------------------------

- **Connection Type:** `URL Only`
- **JDBC URL:** `jdbc:mysql://r6ze0q02l4me77k3.chr7pe7iynqr.eu-west-1.rds.amazonaws.com:3306/lvmp8pcqa129kizx`

| Username         | Password         |
|:----------------:|------------------|
| e2ikxn8dldp8frup | x6fvgr8gj62ba8b9 |

- Click `Apply` and `OK`, if visible **Succeeded** information message when clicked `Test Connection` button.

## <span style="color: red"> For SUPER Privilege Error! </span>

**Error Message;**

```
You do not have the SUPER privilege and binary logging is enabled (you *might* want to use the less safe log_bin_trust_function_creators variable)
```

**Run this script in MySQL Console ->** `SET GLOBAL log_bin_trust_function_creators = 1;`