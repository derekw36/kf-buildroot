#!/bin/sh

# Also can be specified with -platform to the qt binary
export QT_QPA_PLATFORM=eglfs

# We want the default eglfs_kms backend
export QT_QPA_EGLFS_INTEGRATION=eglfs_kms

# Setup output displays. This is REQUIRED for eglfs_kms to work.
export QT_QPA_EGLFS_KMS_CONFIG=/etc/qt/eglfs_dpi.json

# Physical dimensions of the screen, used to calculate DPI.
# Should come out to 169 PPI.
export QT_QPA_EGLFS_PHYSICAL_WIDTH=154
export QT_QPA_EGLFS_PHYSICAL_HEIGHT=90
