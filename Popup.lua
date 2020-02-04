
function RLF_OpenInputBox(title,text,inputboxtext,func,arg1)
  RLF_InputBox_titlet:SetText(title)
  RLF_InputBox_text:SetText(text)
  RLF_InputBox_Data:SetText(inputboxtext)
  RLF_InputBox_Data:SetFocus()
  RLF_InputBox:SetHeight(RLF_InputBox_text:GetStringHeight()+100)
  RLF_InputBox:Show()
  RLF_InputBox_func=func
  RLF_InputBox_arg1=arg1
  RLF_InputBox_Data:HighlightText()
end

function RLF_InputBox_OnEnter()
  RLF_InputBox:Hide()
  local data=RLF_InputBox_Data:GetText()
  if data == "" then data = nil; end
  RLF_InputBox_func(data, RLF_InputBox_arg1)
end
