## Licensing

Make sure that you have a working installation before following the steps in this section.

While designing a system using VSI drag and drop interface is free; generating a system requires a license. We provide a simple and automatic evaluation license for each new installation. The license is initially valid for 30 days and can be extended up-to 90 days.

In order to manage license, use the Visual System integrator launcher tool (`vsi` or `vsi.exe`)

The following commands are supported:

```
vsi -L, --license             query license status
vsi -r, --refresh-license     refreshes the existing license period. The license needs to be active before it can be refreshed
vsi -R, --request-license     request an evaluation license for this node
```

After the installation on a new machine that doesn't have a license, use the `vsi -R` to request an evaluation license. Please fill the fields as accurately as possible as it will help our support staff to facilitate an extension of the evaluation license later, should you request it. The extension can be requested using [this form](https://systemviewinc.com/license.html) (make sure that you use the same `Name` and `Company` fields. The existing license can be queried using `vsi -L`). Note that the initial 30 day license can only be requested for a machine that has never been issued a license before. (contact us using the license form if you need an extension)

Once the fields are filled, the information is used to automatically provision a license.
Later, if the license was extended (either due to evaluation extension or paid conversion), the updated license can be refreshed using `vsi -r`. This will download the updated license and install it.
