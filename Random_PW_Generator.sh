#!/bin/bash

ADMIN_PASSWORD=$(aws secrets manager get-random-password \
    --exclude-punctuation \
    --password-length 41 -- require-each-included-type \
    --output text \
    --query RandomPassword)

# Keep building on this...
