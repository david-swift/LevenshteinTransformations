**EXTENSION**

# `String`

## Methods
### `levenshteinDistance(to:)`

Calculate the Levenshtein distance to another string.
- Parameter target: The target string.
- Returns: The Levenshtein distance.

### `getTransformations(to:)`

Get the transformations needed to transform the string into the target string.
- Parameter target: The target string.
- Returns: The transformations.

### `transform(to:functions:)`

Call every transformation step needed to transform the string into the target string.
- Parameters:
    - target: The target string.
    - functions: The transformation functions.
