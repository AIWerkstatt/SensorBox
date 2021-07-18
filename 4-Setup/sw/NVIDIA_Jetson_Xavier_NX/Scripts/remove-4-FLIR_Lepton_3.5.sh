# Remove FLIR Lepton 3.5 with GroupGets PureThermal 2
# ===================================================

# libuvc (modified by GroupGets)
# ------------------------------
# https://github.com/groupgets/libuvc

# Uninstall libuvc
sudo rm /usr/local/lib/libuvc.so
sudo rm -rf /usr/local/include/libuvc
sudo rm -rf /usr/local/lib/cmake/libuvc

# Delete libuvc
sudo rm -rf /opt/FLIR_Lepton_3.5/libuvc

# Delete udev rule
sudo rm /etc/udev/rules.d/99-pt2.rules
sudo udevadm control --reload-rules && udevadm trigger

# Capture Examples
# ----------------

# Delete capture examples
sudo rm -rf /opt/FLIR_Lepton_3.5/purethermal1-uvc-capture

# GetThermal
# ----------

# Delete GetThermal
sudo rm -rf /opt/FLIR_Lepton_3.5/GetThermal

# Delete FLIR Lepton3.5 and GroupGets PureThermal2
sudo rm -rf /opt/FLIR_Lepton_3.5



