-- MySQL storage engines           – it is essential to understand the features of each storage engine so that you can use them effectively to maximize the performance of your databases.
-- CREATE TABLE                    – how to create new tables in a database using CREATE TABLE statement.
-- AUTO_INCREMENT                  – how to use an AUTO_INCREMENT column generate unique numbers automatically for the primary key.
-- ALTER TABLE                     – learn how to change the structure of a table using the ALTER TABLE statement.
-- Renaming tables                 – how to rename a table using RENAME TABLE statement.
-- Removing a column from a table  – how to use the ALTER TABLE DROP COLUMN statement to remove one or more columns from a table.
-- Adding a new column to a table  – how to add one or more columns to an existing table using ALTER TABLE ADD COLUMN statement.
-- DROP TABLE                      – how to remove existing tables using DROP TABLE statement.
-- Temporary tables                – discuss MySQL temporary tables and how to manage temporary tables effectively.
-- TRUNCATE TABLE                  – how to delete all data from a table fast and more efficient using the TRUNCATE TABLE statement.
-- Generated columns               – guide you on how to use the generated columns to store data computed from an expression or other columns.

-- MySQL provides various storage engines for its tables as follows:

-- MyISAM
-- InnoDB
-- MERGE
-- MEMORY (HEAP)
-- ARCHIVE
-- CSV
-- FEDERATED

-- MyISAM
-- MyISAM extends the former ISAM storage engine. The MyISAM tables are optimized for compression and speed. MyISAM tables are also portable between platforms and operating systems.

-- The size of the MyISAM table can be up to 256TB, which is huge. In addition, MyISAM tables can be compressed into read-only tables to save spaces. At startup, MySQL checks MyISAM tables for corruption and even repairs them in a case of errors. The MyISAM tables are not transaction-safe.

-- Before MySQL version 5.5, MyISAM is the default storage engine when you create a table without specifying the storage engine explicitly. From version 5.5, MySQL uses InnoDB as the default storage engine.

-- InnoDB
-- The InnoDB tables fully support ACID-compliant and transactions. They are also optimal for performance. InnoDB table supports foreign keys, commit, rollback, roll-forward operations. The size of an InnoDB table can be up to 64TB.

-- Like MyISAM, the InnoDB tables are portable between different platforms and operating systems. MySQL also checks and repairs InnoDB tables, if necessary, at startup.

-- MERGE
-- A MERGE table is a virtual table that combines multiple MyISAM tables that have a similar structure to one table. The MERGE storage engine is also known as the MRG_MyISAM engine. The MERGE table does not have its own indexes; it uses indexes of the component tables instead.

-- Using MERGE table, you can speed up performance when joining multiple tables. MySQL only allows you to perform SELECT, DELETE, UPDATE and INSERT operations on the MERGE tables. If you use DROP TABLE statement on a MERGE table, only MERGE specification is removed. The underlying tables will not be affected.

-- Memory
-- The memory tables are stored in memory and use hash indexes so that they are faster than MyISAM tables. The lifetime of the data of the memory tables depends on the uptime of the database server. The memory storage engine is formerly known as HEAP.

-- Archive
-- The archive storage engine allows you to store a large number of records, which for archiving purpose, into a compressed format to save disk space. The archive storage engine compresses a record when it is inserted and decompress it using the zlib library as it is read.

-- The archive tables only allow INSERT and SELECT statements. The ARCHIVE tables do not support indexes, so it is required a full table scanning for reading rows.

-- CSV
-- The CSV storage engine stores data in comma-separated values (CSV) file format. A CSV table brings a convenient way to migrate data into non-SQL applications such as spreadsheet software.

-- CSV table does not support NULL data type. In addition, the read operation requires a full table scan.

-- FEDERATED
-- The FEDERATED storage engine allows you to manage data from a remote MySQL server without using the cluster or replication technology. The local federated table stores no data. When you query data from a local federated table, the data is pulled automatically from the remote federated tables.

-----------------------------------------------------------

-- Create Tables 
CREATE TABLE IF NOT EXISTS tasks (
    task_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    start_date DATE,
    due_date DATE,
    status TINYINT NOT NULL,
    priority TINYINT NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS checklists (
    todo_id INT AUTO_INCREMENT,
    task_id INT,
    todo VARCHAR(255) NOT NULL,
    is_completed BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (todo_id , task_id),
    FOREIGN KEY (task_id)
        REFERENCES tasks (task_id)
        ON UPDATE RESTRICT ON DELETE CASCADE
);

