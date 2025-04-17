object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Lista de Contatos'
  ClientHeight = 573
  ClientWidth = 416
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Label1: TLabel
    Left = 9
    Top = 16
    Width = 36
    Height = 15
    Caption = 'Nome:'
  end
  object Label2: TLabel
    Left = 9
    Top = 45
    Width = 37
    Height = 15
    Caption = 'E-mail:'
  end
  object Label3: TLabel
    Left = 9
    Top = 74
    Width = 48
    Height = 15
    Caption = 'Telefone:'
  end
  object Label4: TLabel
    Left = 9
    Top = 103
    Width = 70
    Height = 15
    Caption = 'Observa'#231#245'es:'
  end
  object dbContatos: TDBGrid
    Left = 8
    Top = 296
    Width = 399
    Height = 261
    DataSource = dsContatos
    TabOrder = 9
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        ReadOnly = True
        Width = 38
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMAIL'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEFONE'
        Width = 100
        Visible = True
      end>
  end
  object btnNew: TButton
    Left = 8
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Novo'
    TabOrder = 4
    OnClick = btnNewClick
  end
  object btnSave: TButton
    Left = 89
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Salvar'
    Enabled = False
    TabOrder = 5
    OnClick = btnSaveClick
  end
  object btnDelete: TButton
    Left = 170
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 6
    OnClick = btnDeleteClick
  end
  object btnCancel: TButton
    Left = 251
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    Enabled = False
    TabOrder = 7
    OnClick = btnCancelClick
  end
  object btnClose: TButton
    Left = 332
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 8
    OnClick = btnCloseClick
  end
  object dbObservations: TDBMemo
    Left = 97
    Top = 100
    Width = 311
    Height = 141
    DataField = 'OBSERVACOES'
    DataSource = dsContatos
    TabOrder = 3
  end
  object dbName: TDBEdit
    Left = 97
    Top = 13
    Width = 311
    Height = 23
    DataField = 'NOME'
    DataSource = dsContatos
    TabOrder = 0
  end
  object dbEmail: TDBEdit
    Left = 97
    Top = 42
    Width = 311
    Height = 23
    DataField = 'EMAIL'
    DataSource = dsContatos
    TabOrder = 1
  end
  object dbPhone: TDBEdit
    Left = 97
    Top = 71
    Width = 311
    Height = 23
    DataField = 'TELEFONE'
    DataSource = dsContatos
    TabOrder = 2
  end
  object fdConn: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\thoma\OneDrive\Documentos\Embarcadero\Studio\P' +
        'rojects\ContactList\CONTACTLIST.IB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=IB')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 488
  end
  object qryContatos: TFDQuery
    Active = True
    Connection = fdConn
    UpdateOptions.AssignedValues = [uvFetchGeneratorsPoint, uvGeneratorName]
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.GeneratorName = 'GEN_CONTATOS_ID'
    UpdateOptions.KeyFields = 'ID'
    UpdateOptions.AutoIncFields = 'ID'
    SQL.Strings = (
      'select * from contatos;')
    Left = 112
    Top = 488
    object qryContatosID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryContatosNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object qryContatosEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 100
    end
    object qryContatosTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
    end
    object qryContatosOBSERVACOES: TMemoField
      FieldName = 'OBSERVACOES'
      Origin = 'OBSERVACOES'
      BlobType = ftMemo
    end
  end
  object dsContatos: TDataSource
    DataSet = qryContatos
    OnDataChange = dsContatosDataChange
    Left = 184
    Top = 488
  end
end
