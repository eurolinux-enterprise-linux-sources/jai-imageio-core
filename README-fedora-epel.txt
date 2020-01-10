jai-imageio-core README for Fedora and EPEL
===========================================

This package contains a CVS snapshot of jai-imageio-core from
https://jai-imageio.dev.java.net/.

Because of copyright issues, some functionality has been removed
for packaging in Fedora and EPEL:

 * JAI Image I/O Operations
 * JPEG 2000 support
 * codecLib (C implementation of plugins for JPEG, PNG, and TIFF)


Everything else should work, including java.nio based ImageIO streams,
and ImageIO readers/writers for:

 * BMP
 * GIF
 * PCX
 * PNM
 * "Raw" (not digital camera RAW)
 * TIFF (some formats unavailable because of missing codecLib)
 * PCX
 * WBMP
