{{- $short := (shortname .Name "err" "res" "sqlstr" "db" "XOLog") -}}
{{- $table := (schema .Schema .Table.TableName) -}}
{{- $primaryKeyName := .PrimaryKey.Name -}}
{{- if .Comment -}}
// {{ .Comment }}
{{- else -}}
// {{ .Name }} represents a row from '{{ $table }}'.
{{- end }}
type {{ .Name }} struct {
{{- range .Fields }}
    {{- if .Comment }}
    // {{ .Comment }}
    {{- else -}}{{- end }}
	{{ .Name }} {{ retype .Type }} `json:"{{ .Col.ColumnName }}" gorm:"Column:{{ .Col.ColumnName }}{{- if eq .Name $primaryKeyName -}};PRIMARY_KEY{{- end -}}"`
{{- end }}
}

func ({{ $short }} *{{ .Name }}) TableName() string {
	return "{{.Table.TableName}}"
}

func ({{ $short }} *{{ .Name }}) AfterFind() (err error) {
	return
}

func ({{ $short }} *{{ .Name }}) BeforeSave() (err error) {
	return
}

func ({{ $short }} *{{ .Name }}) BeforeCreate() (err error) {
	return
}
func ({{ $short }} *{{ .Name }}) AfterCreate() (err error) {
	return
}

func ({{ $short }} *{{ .Name }}) BeforeUpdate() (err error) {
	return
}
func ({{ $short }} *{{ .Name }}) AfterUpdate() (err error) {
	return
}

func ({{ $short }} *{{ .Name }}) AfterSave() (err error) {
	return
}

func ({{ $short }} *{{ .Name }}) BeforeDelete() (err error) {
	return
}
func ({{ $short }} *{{ .Name }}) AfterDelete() (err error) {
	return
}