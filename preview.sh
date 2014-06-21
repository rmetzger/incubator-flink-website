#!/bin/bash

echo "Preview at: http://localhost:4000"
jekyll serve --watch --baseurl '' $@
