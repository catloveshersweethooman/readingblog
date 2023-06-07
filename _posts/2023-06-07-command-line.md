---
layout: post
title: 命令行常用代码
description: "常用的命令行代码"
tags: [命令行, command line]
image:
  background: yellowpaper.png
---

命令行代码的语法重点


1. 命令：命令是执行特定操作的关键字或指令。

示例：`cd` 命令用于改变当前目录。


```bash

# 将当前目录切换到 "Documents" 目录

cd Documents

```


2. 参数：命令可以带有附加的参数，用于指定选项或操作。

示例：`ls` 命令用于列出当前目录的文件和子目录。

```bash

# 列出当前目录中的所有文件和子目录，包括隐藏文件

ls -a

```


3. 选项：选项用于修改命令的行为或提供额外功能。

示例：`grep` 命令用于在文件中搜索匹配的文本。

```bash

# 在文件 "data.txt" 中搜索包含 "keyword" 的行，并显示行号

grep -n "keyword" data.txt

```


4. 参数值：某些选项或命令需要额外的参数值。

示例：`cp` 命令用于复制文件或目录。

```bash

# 将文件 "file.txt" 复制到目标目录 "destination"

cp file.txt destination/

```


5. 文件路径：文件路径用于指定文件或目录的位置。

示例：`rm` 命令用于删除文件或目录。


```bash

# 删除文件 "file.txt"

rm file.txt

```


6. 通配符：通配符用于匹配文件或目录的模式。

示例：`mv` 命令用于移动文件或目录。

```bash

# 将以 "prefix_" 开头的所有文件移动到目录 "new_directory"

mv prefix_* new_directory/

```


7. 管道和重定向：管道和重定向用于处理命令的输入和输出。

示例：`cat` 命令用于显示文件内容。


```bash

# 显示文件 "file.txt" 的内容并将输出保存到 "output.txt" 文件中

cat file.txt > output.txt

```


8. 注释：注释用于添加对命令的说明或注解。

示例：添加注释以帮助理解命令的目的和功能。

```bash

# 执行脚本 "script.sh" 并传递参数 "input.txt" 和 "output.txt"

./script.sh input.txt output.txt

```



