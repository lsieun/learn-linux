# Folding

## Automatic Folding

To enable folding based on **indentation**, set the following:

```
:set foldmethod=indent
```

After this setting, your code will be folded based on the indentation.



| Fold Keys | Description                      |
| --------- | -------------------------------- |
| za        | Toggle the fold under the cursor |
| zR        | Unfold all folds                 |
| zM        | Fold everything back again       |



## Manual Folding

Enable the manual fold as shown below:

```
:set foldmethod=manual
```

You can manipulate manuals folds using following keys:



| Fold Keys          | Description                                  |
| ------------------ | -------------------------------------------- |
| zf<Navigation-Key> | To fold lines selected by the navigation key |
| zf/Pattern         | To fold lines selected by the search search  |
| :range fold        | To fold lines specified by a range           |

You can also save all your folds as shown below:

```
:mkview
```

Open the view to see all saved custom folds:

```
:loadview
```
