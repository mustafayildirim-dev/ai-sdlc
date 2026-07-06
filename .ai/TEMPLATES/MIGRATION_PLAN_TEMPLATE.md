# Migration Plan Template

> Required before any schema change. Present this plan to the human for approval before writing any migration code.

## Plan

**Change:** [description of the schema change]

### Forward Migration (Up)

```
[SQL or ORM migration code]
```

### Rollback Migration (Down)

```
[SQL or ORM code to revert the change]
```

### Application Code Changes

| File | Change Required |
|------|-----------------|
|      |                 |

### Rollback Strategy

If this migration fails in production:
1. [step 1]
2. [step 2]

### Verification

- [ ] Local migration test (up + down)
- [ ] Application code updated for new schema
- [ ] Existing tests still pass
- [ ] New tests for the change
