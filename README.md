projectile-load-settings
========================
Load project specific elisp settings with [projectile](https://github.com/bbatsov/projectile) project.

#FAQ

**Why don't all my settings work after switching projects?**

For some commands such as ```projectile-switch-project``` a project file will
may be visited before settings are loaded by ```'projectile-switch-project-hook```.

In that case, you may have to reset those modes to get them to work with the loaded settings. E.g:

```lisp
(if (string= major-mode "c++-mode") (c++-mode))
```

Will reset ```c++-mode``` for the opened file. Please note that this only works for modes that allow for such a reset. The other solution is not to open a file as the action immediately following ```projectile-switch-project```.
