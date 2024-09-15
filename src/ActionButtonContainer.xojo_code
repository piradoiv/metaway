#tag MobileContainer
Begin MobileContainer ActionButtonContainer
   AccessibilityHint=   ""
   AccessibilityLabel=   ""
   Compatibility   =   ""
   Device = 1
   Height          =   324
   Left            =   0
   Orientation = 0
   Top             =   0
   Visible         =   True
   Width           =   320
   Begin MobileRectangle BackgroundRectangle
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   BackgroundRectangle, 8, <Parent>, 8, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   BackgroundRectangle, 1, <Parent>, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   BackgroundRectangle, 3, <Parent>, 3, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   BackgroundRectangle, 7, <Parent>, 7, False, +1.00, 4, 1, 0, , True
      BorderColor     =   &c000000
      BorderThickness =   0.0
      ControlCount    =   0
      CornerSize      =   42.0
      Enabled         =   True
      FillColor       =   CardBackgroundColorGroup
      Height          =   324
      Left            =   0
      LockedInPosition=   False
      Scope           =   2
      TintColor       =   &c000000
      Top             =   0
      Visible         =   True
      Width           =   320
   End
   Begin MobileImageViewer IconImageViewer
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   IconImageViewer, 9, <Parent>, 9, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   IconImageViewer, 8, , 0, False, +1.00, 4, 1, 48, , True
      AutoLayout      =   IconImageViewer, 10, <Parent>, 10, False, +1.00, 4, 1, -24, , True
      AutoLayout      =   IconImageViewer, 7, , 0, False, +1.00, 4, 1, 48, , True
      ControlCount    =   0
      DisplayMode     =   0
      Enabled         =   True
      Height          =   48
      Image           =   0
      Left            =   136
      LockedInPosition=   False
      Scope           =   2
      TintColor       =   &c000000
      Top             =   114
      URL             =   ""
      Visible         =   True
      Width           =   48
   End
   Begin MobileLabel CaptionLabel
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   1
      AutoLayout      =   CaptionLabel, 9, <Parent>, 9, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   CaptionLabel, 8, , 0, False, +1.00, 4, 2, 40, , True
      AutoLayout      =   CaptionLabel, 3, IconImageViewer, 4, False, +1.00, 4, 1, *kStdControlGapV, , True
      AutoLayout      =   CaptionLabel, 7, <Parent>, 7, False, +0.50, 4, 1, 0, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   40
      Left            =   80
      LineBreakMode   =   0
      LockedInPosition=   False
      MaximumCharactersAllowed=   0
      Scope           =   2
      SelectedText    =   ""
      SelectionLength =   0
      SelectionStart  =   0
      Text            =   "Untitled"
      TextColor       =   TextColorGroup
      TextFont        =   ""
      TextSize        =   0
      TintColor       =   &c000000
      Top             =   170
      Visible         =   True
      Width           =   160
   End
   Begin MobileButton ActionButton
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   ActionButton, 4, <Parent>, 4, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   ActionButton, 1, <Parent>, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   ActionButton, 2, <Parent>, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   ActionButton, 3, <Parent>, 3, False, +1.00, 4, 1, 0, , True
      Caption         =   ""
      CaptionColor    =   &c007AFF00
      ControlCount    =   0
      Enabled         =   True
      Height          =   324
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      TextFont        =   ""
      TextSize        =   0
      TintColor       =   &c000000
      Top             =   0
      Visible         =   True
      Width           =   320
   End
End
#tag EndMobileContainer

#tag WindowCode
	#tag Hook, Flags = &h0
		Event Pressed()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return CaptionLabel.Text
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  CaptionLabel.Text = value
			End Set
		#tag EndSetter
		Caption As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mIconName
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mIconName = value
			  If value = "" Then
			    IconImageViewer.Image = Nil
			  Else
			    IconImageViewer.Image = Picture.SystemImage(value, IconImageViewer.Width)
			  End If
			End Set
		#tag EndSetter
		IconName As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mIconName As String
	#tag EndProperty


#tag EndWindowCode

#tag Events ActionButton
	#tag Event
		Sub Pressed()
		  RaiseEvent Pressed
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=false
		Group="Position"
		InitialValue="320"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=false
		Group="Position"
		InitialValue="480"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TintColor"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="ColorGroup"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ControlCount"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Caption"
		Visible=true
		Group="Behavior"
		InitialValue="FooBar"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="IconName"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AccessibilityHint"
		Visible=false
		Group="UI Control"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AccessibilityLabel"
		Visible=false
		Group="UI Control"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="UI Control"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="UI Control"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
