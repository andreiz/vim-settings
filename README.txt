Intro
~~~~~

These are my personal settings. I have found them useful for general editing and
for working with PHP files specifically. You are free to use them, but remember
that you can and should change them according to your standards or liking.

All the settings and functions in .vimrc and .vim/ directory are commented and
hopefully contain enough info to explain what is going on. If you are in doubt,
put your cursor on a command or an option name, do:

    :help <Ctrl-R><Ctrl-W>

and hit <Enter>. This will pull up help for the topic that's under the cursor.


Installation
~~~~~~~~~~~~

The .vimrc and .vim/ directory should be usable as-is, if you copy them into
your home directory. However, since you are likely to have some customization
settings already, I would advise looking through the contents of the files
I provide and copying only the portions you want. The files in .vim/plugin/ can
be copied directly (make sure to copy additional plugin files that may be in
.vim/doc/ and .vim/after/ directories).

Some plugins have accompanying documentation. To include it into VIM's help
system, issue this command:

    :helptags ~/.vim/doc

After this you can pull up help for a plugin by doing:

    :help <file>

Where <file> is the name of the file in the .vim/doc/ directory. You can also
get :help on specific commands.


PHP highlighting
~~~~~~~~~~~~~~~~

I have specific tastes for PHP highlighting which are expressed in
.vim/after/syntax/php.vim. Delete the file or change it to your liking.


PHP indentation
~~~~~~~~~~~~~~~

I do not particularly like the way VIM's built-in PHP indenting works, so I turn
it off in .vim/after/indent/php.vim and use C-style indenting instead. If you
wish to use PHP-style indenting, comment out those lines.


Exuberant Ctags
~~~~~~~~~~~~~~~

Download Exuberant Ctags from http://ctags.sourceforge.net/. After you
compile and install it, edit .vim/ftplugin/php.vim, find the line with
"ctags" and change the executable name to point to you particular file path
(if you name it something else). Also, edit .vim/after/plugin/general.vim
and change the Tlist_Ctags_Cmd value as well.

You can use <F4> key to re-build the tags file from inside vim. Make sure to
save your current file before invoking <F4> so that ctags picks up any new
identifiers you may have added. The mapping will start the scan from the
directory of the file you are editing and process all the files from that point
recursively. The actual tags file is created in the same directory as the file
you are editing.

Exuberant Ctags currently treats class methods as simple functions. This affects
a couple of areas, including completion. For example, if you have:

    $foo = new Foo();
    $foo-><Ctrl-X><Ctrl-O>

The popup window will contain all the functions from the tags file as well as
all the methods of built-in PHP objects. Hopefully, ctags will fix this soon.
Until then, I find it helpful to reduce the list by removing the built-in object
methods. You can do this by uncommenting indicated lines in
.vim/after/ftplugin/php.vim.


Plugins
~~~~~~~

This distribution bundles a few plugins that I have found useful.

    NERD_tree.vim
    matchit.vim
    oscan.vim (0scan)
    project.vim
    snippetsEmu.vim
    taglist.vim
    command-t.vim

You can read more about them on this site:

    http://vim.sourceforge.net/scripts/
    
Note that I bind <Ctrl-B> as the expansion key for snippets. You can change
this in .vim/after/plugin/general.vim.


Xdebugger
~~~~~~~~~

The xdebug support inside VIM is provided via plugin by Seung Woo Shin. In
order to use it, your VIM needs to have +python feature (run vim --version
to see whether it is present). The files are in xdebugger/ directory.

In your php.ini file these settings need to be present:

  xdebug.remote_enable  = On
  xdebug.remote_host    = localhost ; host or IP name of the machine running VIM
  xdebug.remote_port    = 9000      ; port on which debugger.py is listening
  xdebug.remote_mode    = "req"     ; connect on request start
  xdebug.remote_handler = "DBGp"

See this article for some additional info:

    http://2bits.com/articles/using-vim-and-xdebug-dbgp-for-debugging-drupal-or-any-php-application.html

I made some slight modifications to the scripts. The trace window was taking up
space, so it is turned off. If there is an exception condition from debugger.py,
it will not be shown. If you do want trace window, search for every place where
'tracewin' is used in debugger.py and uncomment those lines. The debugger
control keys are remapped to start with <Leader>, which should be backslash (\)
by default. So, instead of hitting <F5>, you need to to hit \<F5>. This is done
because a lot of other plugins map function keys to their commands. Feel free
to change these mappings if you want to.

I would advise placing the debugger scripts in ~/.vim/xdebugger directory,
so that they are not loaded for every vim session. Instead load it
explicitly with:

    vim -c ":source $HOME/.vim/xdebugger/debugger.vim"

After that you can do:

    :e /path/to/my/file.php

and start debugging.
