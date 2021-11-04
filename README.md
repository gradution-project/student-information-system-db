# <img src="https://bit.ly/3yP9D95" width="60" align="center"/> MySQL Database Installation Document

## Install MySQL Database

### [MySQL Community Server](https://dev.mysql.com/downloads/mysql/)

- [x] Packages for macOS Big Sur (macOS 11) on x86 are compatible with macOS Catalina (macOS 10.15)
- [x] MySQL Community Server Version `8.0.26` must be downloaded!

---

### For Windows (x86, 64-bit)

#### [MySQL Community Server 8.0.26](https://dev.mysql.com/downloads/file/?id=506256)

---

### For macOS 11 (x86, 64-bit)

#### [MySQL Community Server 8.0.26](https://dev.mysql.com/downloads/file/?id=506505)

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

## <span style="color: red"> For SUPER Privilege Error! </span>

**Error Message;**

```
You do not have the SUPER privilege and binary logging is enabled (you *might* want to use the less safe log_bin_trust_function_creators variable)
```

**Run this script in MySQL Console ->** `SET GLOBAL log_bin_trust_function_creators = 1;`