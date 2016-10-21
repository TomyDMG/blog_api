class @UploadAvatar extends React.Component
  constructor: (props) ->
    super(props)
    @state =
      token: ''
      url: ''
      file: null
    @changeToken = @changeToken.bind(this)
    @changeFile = @changeFile.bind(this)
    @handleSubmit = @handleSubmit.bind(this)

  changeToken: (e) ->
    @setState token: e.target.value

  changeFile: (e) ->
    reader = new FileReader
    file = e.currentTarget.files[0]
    that = this
    reader.onloadend = ->
      that.setState file: file
    if file
      reader.readAsDataURL file
    else
      @setState
        file: null

  handleSubmit: (e) ->
    e.preventDefault()
    formData = new FormData()
    formData.append("avatar", @state.file)
    token = @state.token
    $.ajax
      url: '/api/v1/upload_avatar'
      type: 'POST'
      beforeSend: (xhr) ->
        xhr.setRequestHeader('Authorization', token)
        return
      processData: false
      contentType: false
      dataType: 'json'
      data: formData
      success: (data) =>
        @setState url: data["url"]

  render: ->
    `<form>
      <hr />
      <div className='form-group'>
        <label>Authorization token (JWT)</label>
        <input className='form-control' type='text' name='token'
        placeholder='Enter token' value={this.state.token} onChange={this.changeToken}/>
      </div>
      <div className='form-group'>
        <label>Avatar</label>
        <input type="file" onChange={this.changeFile} className='form-control' />
      </div>
      <button className='btn btn-primary' onClick={this.handleSubmit}>Upload!</button>
      <hr />
      <img src={this.state.url} />
    </form>`
