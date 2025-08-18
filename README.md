# hp-41_mcode-tools

[![HP-41](https://img.shields.io/badge/HP--41-Calculator-orange)](https://en.wikipedia.org/wiki/HP-41C)
[![License](https://img.shields.io/badge/License-Public%20Domain-brightgreen.svg)](https://unlicense.org/)
[![GitHub stars](https://img.shields.io/github/stars/isene/hp-41_mcode-tools.svg)](https://github.com/isene/hp-41_mcode-tools/stargazers)
[![Stay Amazing](https://img.shields.io/badge/Stay-Amazing-blue.svg)](https://isene.org)

A collection of tools for MCODE (assembly) programming on the Coconut processor (HP-41 calculator)

## VIM filetype plugin

Use the mcode.vim to make it easy to take disassembled ROMs from Meindert Kuiper's M2KM software (runs well with Wine under Ubuntu Linux).

To source the plugin for files with extensions "*.s" and "*.asm", place "mcoed.vim" in your ftplugin directory and add the following to your ".vimrc":

	autocmd BufRead,BufNewFile *.s :source ~/.vim/ftplugin/mcode.vim
	autocmd BufRead,BufNewFile *.asm :source ~/.vim/ftplugin/mcode.vim

It includes two scripts - one that fixes HP mnemonic disassembled files and one that fixes JDA mnemonics. By "fixing" is meant to ready the files to be used by Håkan Tørngren's Nutstudio. The scripts takes files that have one hex code per line (see the M2KM options) with labels throughout and links all labels with correct goto/gosub statements and comments out the mnemonics and leaves the hex code to be read by Nutstudio via the ".con" directive. See the AMASTRO.ROM project as an example: https://github.com/isene/hp-41_AMASTRO.ROM

More tools will be added as I see fit.

## License
This software is released into the Public Domain.
