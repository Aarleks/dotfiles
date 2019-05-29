#!/usr/bin/env bash

# Function 1 - takes a MIME message file and a relative path to an RMarkdown file as arguments.
# Can also take arguments to pass to `rmarkdown` functions.

# take the mail file from neomutt
# get the 'part'
# if no markdown marker, send to msmtpc
# else if markdown, do
    #
# else if Rmarkdown, do
    #

# Function 2 -

# reads an Rmarkdown file and turns it into a multipart email.

# Functino 3 -

# From R, takes an Rmarkdown file and turns it into a multipart email, and then invokes Mutt to send the message.

# Function 4 - a

# adds compiled Rmarkdown documents as attachments to email message.

INPUT=`mktemp -t input`.Rmd
OUTPUT=`mktemp -t output`.html

cat - > $INPUT

Rscript --vanilla -e "rmarkdown::render('$INPUT',  output_file='$OUTPUT', quiet = TRUE)" > /dev/null

cat $OUTPUT

unlink $INPUT
unlink $OUTPUT
