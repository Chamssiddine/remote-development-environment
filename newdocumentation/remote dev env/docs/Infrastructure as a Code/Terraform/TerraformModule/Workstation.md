---
sidebar_position: 2
---
## Module Purpose
The purpose of this module is to create the necessary infrastructure for developers, starting from firewall configuration, VPC setup, subnet configuration, and provisioning instances. It also provides the flexibility to easily add new instances for new developers or modify existing instances.

## Adding new developer
### 1. Navigate to the **Workstation Module**
```bash
cd infrastructure/modules/workstation
```

### 2. Modify the **main.tf** File


export const Highlight = ({children, color}) => (
  <span
    style={{
      backgroundColor: color,
      borderRadius: '20px',
      color: '#fff',
      padding: '10px',
      cursor: 'pointer',
    }}
    onClick={() => {
      alert(`this is the map for the developer instances modify it as you wish`)
    }}>
    {children}
  </span>
);

Locals <Highlight color="#25c2a0">section</Highlight> :


```python
locals {
  // to add new workstation just add a new list with it's name, machine_type, your prefered os and zone
  workstations = {
  "workstation1" = { machine_type = "e2-medium", zone = "europe-west9-a", tag = ["ping", "ssh","metrics"], image = "debian-cloud/debian-11", bucket_name = "uniquename" },  
  "workstation2" = { machine_type = "e2-micro", zone = "europe-west9-a", tag = ["ping", "ssh","metrics"], image = "debian-cloud/debian-11", bucket_name = "uniquename" },
 "workstation3" = { machine_type = "e2-micro", zone = "europe-west9-a", tag = ["ping", "ssh"], image = "debian-cloud/debian-11", bucket_name = "uniquename" }
  }
}
```
Add a new entry for the new developer's workstation in the workstations map. Here's an example of how it should look:

![Creating another workstation](https://user-images.githubusercontent.com/62959061/229340280-1b1614f1-7140-4274-b8df-a177f1aecf0c.mov)

![Creating another workstation](/g.gif)

### 3. Save the **main.tf** file.

### 4. Apply the changes and type in the following command:

```python
$ terrafrom apply
```

This will provision a new VM for the new developer with the specified settings.

## Conclusion

That's it! You should now have a new VM for the new developer ready to use. If you have any questions or run into any issues, feel free to reach out to me for assistance.
