How to Record Linux Terminal
============================

.. http://www.tecmint.com/record-and-replay-linux-terminal-session-commands-using-script/

The script command stores terminal activities in a log file that can be named by a user, when a name is not provided by a user, the default file name, typescript is used.

Syntax,

::

	script [options] --timing=timing_file log_filename

You may use the -a option to append the log file or typescript, retaining the prior contents.

::

	script -a script.log

To log results of a single command other than an interactive shell session, use the -c option.

::

	script -c 'hostname' script.log

If you want script to run in a quiet mode then you can use the -q option. You will not see a massage that shows script is starting or exiting.

::

	script -c 'who'  -q  script.log

For more information use following command

::

	man script

Using scriptreplay to replay scripts using timing information
-------------------------------------------------------------

The scriptrepaly command helps to replay information in your log_file used with the script command.

The timing information is defined by the -timing=file option used with the script command and file in this case is file.txt that was used with script command.

Remember you need to specify the log_file you used with the script command.

::

	scriptreplay --timing=time.txt script.log

When the log_file replayed using the timing information, the commands recorded are run and their output is displayed at the same time the original output was displayed while being recorded.
