**ENUM**

# `LevenshteinTransformations`

The enumeration holding the transformation functions.

## Methods
### `levenshteinTransformations(from:to:)`

The transformation function for arrays with equatable elements.
- Parameters:
    - source: The original array.
    - target: The target array.
- Returns: The required transformations.

### `setOperations(_:editDistances:source:target:)`

Set the operations and edit distances according to the source and target array.
- Parameters:
    - operations: The operations.
    - editDistances: The edit distances.
    - source: The original array.
    - target: The target array.
- Returns: The required transformations.

### `levenshteinTransformations(from:to:)`

The transformation function for arrays with identifiable elements.
- Parameters:
    - source: The original array.
    - target: The target array.
- Returns: The required transformations.
