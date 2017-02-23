# john-lewis

Due to the time constraints (less than 24h notice):
- Only Grid View Controller has been completed
- Only display the first 20 elements. It doesn't make multiple calls to get all the data when scrolling is necessary
- Grid View Controller is strongly attached to the search. In order to be more reusable, I would inject the function I need to call instead of the network object. In this way, the view could be reuse for different purposes.
- ProductSimple and ProductSimpleContainer initializations never fail. Return an object with empty fields for simplicity
- Product cell set its own data instead of implement a builder. In this way, the cell would be independent from the model and wouldn't be necessary to include Network class to get the image
- UI is far from pixel perfect
- Unit tests don't cover edge cases
- Unit tests haven't been refactored
- ProductGridDataSource need to be renamed. It's functionality has change
- Network class needs testing
