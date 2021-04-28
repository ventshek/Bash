@extends('layouts.admin')

@section('title')
    Edit Mod
@endsection

@section('content-header')
    <h1>Edit Mod
        <small>You can create mod.</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="{{ route('admin.index') }}">Admin</a></li>
        <li><a href="{{ route('admin.mods') }}">Mod Manager</a></li>
        <li class="active">Edit Mod</li>
    </ol>
@endsection

@section('content')
    <div class="row">
        <div class="col-xs-12">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">Edit Mod</h3>
                    <div class="box-tools">
                        <a href="{{ route('admin.mods') }}">
                            <button type="button" class="btn btn-sm btn-primary"
                                    style="border-radius: 0 3px 3px 0;margin-left:-1px;">Go Back
                            </button>
                        </a>
                    </div>
                </div>
                <form method="post" action="{{ route('admin.mods.update', $mod->id)  }}">
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-8 col-xs-12">
                                <div class="form-group">
                                    <label for="name" class="form-label">Name</label>
                                    <input type="text" name="name" id="name" class="form-control"
                                           placeholder="For example: Health System" value="{{$mod->name}}" />
                                </div>
                            </div>
                            <div class="col-md-4 col-xs-12">
                                <div class="form-group">
                                    <label for="version" class="form-label">Version</label>
                                    <input type="text" name="version" id="version" class="form-control"
                                           placeholder="For example: 1.0" value="{{$mod->version}}" />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="category" class="form-label">Category</label>
                            <input type="text" name="category" id="category" class="form-control"
                                   placeholder="For example: Tools" value="{{$mod->category_name}}" />
                        </div>
                        <div class="form-group">
                            <label for="description" class="form-label">Description</label>
                            <input type="text" name="description" id="description" class="form-control"
                                   placeholder="Short Description" value="{{$mod->description}}" />
                        </div>
                        <hr>
                        <div class="form-group">
                            <label for="egg_ids" class="form-label">Servers (when it's available)</label>
                            <select class="form-control" id="egg_ids" name="egg_ids[]" multiple>
                                @foreach($eggs as $egg)
                                    @if (in_array($egg->id, explode(',', $mod->egg_id)))
                                        <option value="{{ $egg->id }}" selected>{{ $egg->name }}</option>
                                    @else
                                        <option value="{{ $egg->id }}">{{ $egg->name }}</option>
                                    @endif
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="download" class="form-label">Download URL (.ZIP file)</label>
                            <input type="text" name="download" id="download" class="form-control"
                                   placeholder="For example: https://mydomain.tld/mod.zip"
                                   value="{{$mod->download_url_zip}}" />
                            <p class="small text-muted no-margin">This file will be download when users install this
                                mod.</p>
                        </div>
                        <div class="form-group">
                            <label for="install" class="form-label">Install Folder</label>
                            <div class="input-group">
                                <span class="input-group-addon">/home/container/</span>
                                <input type="text" name="install" id="install" class="form-control"
                                       placeholder="For example: mods" value="{{$mod->install_folder}}" />
                            </div>
                            <p class="small text-muted no-margin">The mod will be download to this folder.</p>
                        </div>
                        <div class="form-group">
                            <label for="remove" class="form-label">Delete Folder or File</label>
                            <div class="input-group">
                                <span class="input-group-addon" id="remove_pre">/home/container/</span>
                                <input type="text" name="remove" id="remove" class="form-control"
                                       placeholder="For example: mymod.jar" value="{{$mod->uninstall_name}}" />
                            </div>
                            <p class="small text-muted no-margin">This folder or file will be delete when users remove
                                this mod.</p>
                        </div>
                    </div>
                    <div class="box-footer">
                        {!! csrf_field() !!}
                        <button class="btn btn-success pull-right" type="submit">Update</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection

@section('footer-scripts')
    @parent
    <script>
        $('#egg_ids').select2({
            placeholder: 'Select Eggs',
        });

        function showInstallFolder() {
            let install = $('#install').val();
            install.length > 0 ? install += '/' : install;
            $('#remove_pre').text('/home/container/' + install);
        }

        $('#install').on('input', function () {
            showInstallFolder();
        });

        $(document).ready(function () {
            showInstallFolder();
        });
    </script>
@endsection
