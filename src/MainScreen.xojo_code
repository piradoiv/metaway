#tag MobileScreen
Begin MobileScreen MainScreen
   BackButtonCaption=   ""
   Compatibility   =   ""
   ControlCount    =   0
   Device = 1
   HasNavigationBar=   True
   LargeTitleDisplayMode=   2
   Left            =   0
   Orientation = 0
   TabBarVisible   =   True
   TabIcon         =   0
   TintColor       =   &c000000
   Title           =   "Metaway"
   Top             =   0
   Begin ActionButtonContainer NewPictureActionButton
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   NewPictureActionButton, 8, <Parent>, 8, False, +0.33, 4, 1, 0, , True
      AutoLayout      =   NewPictureActionButton, 1, <Parent>, 1, False, +1.00, 4, 1, *kStdGapCtlToViewH, , True
      AutoLayout      =   NewPictureActionButton, 2, <Parent>, 2, False, +1.00, 4, 1, -*kStdGapCtlToViewH, , True
      AutoLayout      =   NewPictureActionButton, 3, TopLayoutGuide, 4, False, +1.00, 4, 1, 0, , True
      Caption         =   "Take a new picture"
      ControlCount    =   0
      Enabled         =   True
      Height          =   187
      IconName        =   "camera"
      Left            =   20
      LockedInPosition=   False
      Scope           =   2
      TintColor       =   &c000000
      Top             =   65
      Visible         =   True
      Width           =   280
      _ClosingFired   =   False
   End
   Begin ActionButtonContainer RemoveMetadataActionButton
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   RemoveMetadataActionButton, 8, <Parent>, 8, False, +0.33, 4, 1, 0, , True
      AutoLayout      =   RemoveMetadataActionButton, 1, <Parent>, 1, False, +1.00, 4, 1, *kStdGapCtlToViewH, , True
      AutoLayout      =   RemoveMetadataActionButton, 2, <Parent>, 2, False, +1.00, 4, 1, -*kStdGapCtlToViewH, , True
      AutoLayout      =   RemoveMetadataActionButton, 3, NewPictureActionButton, 4, False, +1.00, 4, 1, *kStdControlGapV, , True
      Caption         =   "Remove metadata from picture"
      ControlCount    =   0
      Enabled         =   True
      Height          =   187
      IconName        =   "photo"
      Left            =   20
      LockedInPosition=   False
      Scope           =   2
      TintColor       =   &c000000
      Top             =   260
      Visible         =   True
      Width           =   280
      _ClosingFired   =   False
   End
   Begin MobileImagePicker MyImagePicker
      AllowEditing    =   False
      Left            =   0
      LockedInPosition=   False
      PanelIndex      =   -1
      Parent          =   ""
      Scope           =   2
      Source          =   0
      Top             =   0
   End
   Begin Timer ProcessImageTimer
      LockedInPosition=   False
      PanelIndex      =   -1
      Parent          =   ""
      Period          =   50
      RunMode         =   0
      Scope           =   2
   End
   Begin MobileSharingPanel Share
      Left            =   0
      LockedInPosition=   False
      PanelIndex      =   -1
      Parent          =   ""
      Scope           =   2
      Top             =   0
   End
End
#tag EndMobileScreen

#tag WindowCode
	#tag Property, Flags = &h21
		Private mImage As Picture
	#tag EndProperty


#tag EndWindowCode

#tag Events NewPictureActionButton
	#tag Event
		Sub Pressed()
		  MyImagePicker.Source = MobileImagePicker.Sources.Camera
		  MyImagePicker.Show(Self)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events RemoveMetadataActionButton
	#tag Event
		Sub Pressed()
		  MyImagePicker.Source = MobileImagePicker.Sources.Photos
		  MyImagePicker.Show(Self)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events MyImagePicker
	#tag Event
		Sub Selected(pic As Picture)
		  mImage = pic
		  ProcessImageTimer.RunMode = Timer.RunModes.Single
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ProcessImageTimer
	#tag Event
		Sub Run()
		  If mImage = Nil Then
		    Return
		  End If
		  
		  Var p As Picture = Picture.FromData(mImage.ToData(Picture.Formats.HEIC, Picture.QualityHigh))
		  Share.SharePicture(p, Self, NewPictureActionButton)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Index"
		Visible=true
		Group="ID"
		InitialValue="-2147483648"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
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
		Name="BackButtonCaption"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasNavigationBar"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIcon"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Behavior"
		InitialValue="Untitled"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LargeTitleDisplayMode"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="MobileScreen.LargeTitleDisplayModes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Automatic"
			"1 - Always"
			"2 - Never"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabBarVisible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
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
#tag EndViewBehavior
