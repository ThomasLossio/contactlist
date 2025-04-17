# 🧮 Contact List

A simple contact registration app built with **Delphi 12.1 Community Edition** as part of a personal study roadmap.

## ✨ Features
- Add new contact
- Edit data through data-aware components
- Delete contact with confirmation
- Cancel edits
- Exit the application with confirmation
- Field validation (Name is required)
- Clean and intuitive UI with `TDBEdit`, `TDBMemo`, and `TDBGrid`
- Auto-generated ID via `GENERATOR` and `TRIGGER`

## 🖼️ Screenshot
![image](https://github.com/user-attachments/assets/253992e5-804b-40ef-8709-145293bd7517)


## 🚀 How to Run
1. Open the project in **Delphi 12.1 Community Edition**
2. Open `frmMain.pas`
3. Press `F9` to build and run

## 📁 Project Structure
| File | Description |
|------|-------------|
| `frmMain.pas` | Main form logic and operations |
| `frmMain.dfm` | UI layout (fields, grid, buttons) |
| `contatos.ib` | Local InterBase database file |
| `Database Structure.sql` | SQL script to create table, generator, and trigger |

## 🗄️ Database
The full table and trigger structure is available in the file:
```
📄 Database Structure.sql
```
This file contains the SQL script used to create the `CONTATOS` table, the generator, and the trigger for auto-incrementing the `ID` field.

## 📄 .gitignore Notes
This project ignores all temporary, compiled, and IDE-specific files:
- Binaries (`*.exe`, `*.dcu`, etc.)
- Build folders (`Win32/Debug/`, etc.)
- Delphi IDE files (`*.identcache`, `*.dsk`, `__history/`, etc.)
- Database files (`*.ib`, `*.gdb`, `*.fdb`)

Refer to the `.gitignore` file for full details.

## 🛠️ Requirements
- Delphi 12.1 Community Edition
- InterBase 2020 (default embedded version)

## 📃 License
MIT

---
Made with ☕, and a little bit of 🙃

