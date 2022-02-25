<style>
    .search-form {
        width: 250px;
        margin: 10px 0 0 20px;
        border-radius: 3px;
        float: left;
    }

    .search-form input[type="text"] {
        color: #666;
        border: 0;
    }

    .search-form .btn {
        color: #999;
        background-color: #fff;
        border: 0;
    }
</style>
@php
$_log_number = "";
if(isset($_GET['lot_number'])){
$_log_number = $_GET['lot_number'];
}
@endphp

<form action="{{admin_url('track-and-trace')}}" method="get" class="search-form">
    <div class="input-group input-group-sm ">
        <input type="text" name="lot_number" required value="{{$_log_number}}" class="form-control"
            placeholder="Enter LOT NUMBER">
        <span class="input-group-btn">
            <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i
                    class="fa fa-search"></i></button>
        </span>
    </div>
</form>