Class {
	#name : #GtPhlowListToSelectHandler,
	#superclass : #GtPhlowListHandler,
	#category : #'GToolkit-Phlow-Events'
}

{ #category : #accessing }
GtPhlowListToSelectHandler >> eventClasses [
	^ { BrSelectionChanged . BrSelectionDoubleClicked }
]

{ #category : #'api - event managing' }
GtPhlowListToSelectHandler >> handleEvent: anEvent [
	anEvent acceptInspectorHandler: self
]

{ #category : #'api - event managing' }
GtPhlowListToSelectHandler >> selectionChangedEvent: anEvent [
	| aWidgetElement |

	aWidgetElement := anEvent currentTarget.
	anEvent asBeaconSignal emit.

	anEvent selectedDo: [ :anInterval |
		| selectedObject |

		selectedObject := aWidgetElement viewModel itemAt: anInterval first.
		aWidgetElement phlow 
			selectObject: (self transformedValueFrom: selectedObject selection: anInterval).
		aWidgetElement fireEvent: (GLMBlocObjectToSelect new toSelect: (self transformedValueFrom: selectedObject selection: anInterval)) ]
]

{ #category : #'api - event managing' }
GtPhlowListToSelectHandler >> selectionDoubleClickedEvent: anEvent [
	
	anEvent selection
		ifNotEmpty: [ :theIndices |
			| aWidgetElement selectedObject |
	
			aWidgetElement := anEvent currentTarget.
			
			selectedObject := aWidgetElement viewModel itemAt: theIndices first.
			aWidgetElement phlow spawnObject: 
				(self transformedValueFrom: selectedObject selection: theIndices).
			aWidgetElement fireEvent: (GLMBlocObjectToSelect new 
				toSelect: (self transformedValueFrom: selectedObject selection: theIndices)) ]
]

{ #category : #'api - event managing' }
GtPhlowListToSelectHandler >> wantsEvent: anEvent [
	^ self eventClasses includes: anEvent class
]