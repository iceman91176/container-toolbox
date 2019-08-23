RBD Provisioner Chart
-------------------------------------------------------------------------------

Based on https://opendev.org/starlingx/config/raw/branch/master/kubernetes/helm-charts/rbd-provisioner

Difference to the original is the handling of secrets

* Admin-Secret-Key has to be provided for every storage-class (or in the class defaults) in variable adminSecret
* User-Secrets are create for every storage-class. The secret-key has to be provided in the classConfig Variable userSecret, or in the class defaults


