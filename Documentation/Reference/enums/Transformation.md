**ENUM**

# `Transformation`

A transformation (replace, delete or insert).

## Cases
### `replace(at:with:)`

Replace the element at a certain index with a certain element.

### `delete(at:)`

Delete the element at a certain index.

### `insert(at:element:)`

Insert a certain element at a certain index.

## Properties
### `index`

The index at which is directly affected by the transformation.

### `element`

The element which is directly affected by the transformation.

## Methods
### `description(source:)`

A description of the transformation.
- Parameter source: The initial array.
- Returns: The description.

### `log(source:)`

Print a description of the transformation.
- Parameter source: The initial array.

### `transform(functions:nextTransformations:)`

Apply the transformation using a functions value.
- Parameters:
    - functions: The functions value.
    - nextTransformations: All the following transformations for modifying the indices.
