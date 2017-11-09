WebStorm配置
===========

##### File--->Settings--->Languages & Frameworks
- Node.js Interpreter
    + Node.js and NPM--->Node.js Interpreter
        * Node Interpreter:
            - /usr/bin/node
        * Npm package:
            - /opt/node/lib/node_modules/npm
- ECMAScript版本
    + JavaScript

##### Database Navigator
- File--->Settings--->Plugins--->Database Navigator
- 设置去掉
    + [MySQL jdbc connector](http://www.mysql.com/downloads/connector/j/)
    + 解压
    + DB Navigator--->Settings--->Connection--->Driver source
        * External library
            - Driver library
                + MySQL jdbc connector路径
            - Driver
                + com.mysql.jdbc.Driver

##### 使用npm
1. 在package.json文件上点击右键
    + 点击show npm scripts
    + 双击想要运行的script
2. 配置Run/Debug Configuration
    + 点击run ***