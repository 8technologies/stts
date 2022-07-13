@php
    use App\Models\Product;
    use App\Models\User;
    use App\Models\Chat;
    use App\Models\Utils;

    $sender = Auth::user();
    $threads = Utils::get_chat_threads($sender->id);
    $thread = request()->segment(2);
    $chat_is_open = false;
    $messgae_url = "/";
    if($thread!=null){
        if(strlen($thread)>2){
            $ids = explode("-",$thread);
            if(count($ids)>2){
                $receiver_id = 0;
                if($sender->id != $ids[0]){
                    $receiver_id = $ids[0];
                }
                if($sender->id != $ids[1]){
                    $receiver_id = $ids[1];
                }
                if($receiver_id == 0){
                    dd("recevier_id not found");
                }
                $product_id = $ids[2];
                $receiver = User::where('id', $receiver_id)->firstOrFail();
                $product = Product::where('id', $product_id)->firstOrFail();
                $inbox = Chat::where('thread', $thread)->get();

                if(
                    $product != null &&
                    $receiver != null &&
                    $sender != null
                ){
                    $chat_is_open= true;
                }
            }
        }
    }

@endphp

@extends('layouts.layout')

@section('title', 'Page Title')

@section('head')
<link rel="stylesheet" href="{{ URL::asset('/assets/css/vendor/nice-select.min.css') }}">
<link rel="stylesheet" href="{{ URL::asset('/assets/css/vendor/emojionearea.min.css') }}">
<link rel="stylesheet" href="{{ URL::asset('/assets/css/custom/message.css') }}">
@endsection

@section('content') 
<section class="message-part pt-0 pt-2">
    <div class="container mt-0">
        <div class="row">
            <div class="col-lg-5 col-xl-4">
                <div class="message-filter">
                    <div class="message-filter-group d-none d-md-flex"><select class="select">
                            <option value="">all message</option>
                            <option value="">read message</option>
                            <option value="">unread message</option>
                        </select><button class="message-filter-btn"><i class="fas fa-search"></i></button></div>
                    <form class="message-filter-src"><input type="text" placeholder="Search for Username"></form>
                    <ul class="message-list">

                        @foreach ($threads as $item)
                            @php
                                $is_seen = "";
                                $is_active = "";
                                $is_seen = "";
                                $count = 0;
                                if($item->seen){
                                    $is_seen = "";
                                }else {
                                    $results = DB::select(
                                                'SELECT count(id) as count FROM chats WHERE 
                                                    thread = :thread AND
                                                    seen   =  :seen AND
                                                    sender   !=  :sender 
                                                ',[
                                                    'thread' => $item->thread,
                                                    'seen' => 0,
                                                    'sender' => $sender->id,
                                    ]);
                                    if(isset($results[0])){
                                        $count = $results[0]->count;
                                    }

                                    if($count>0){
                                        $is_seen = "  unread ";
                                    }
 
                                    if($item->thread == $thread){
                                        $count = 0;
                                        $is_seen = "  ";



                                        DB::update(
                                                'UPDATE chats SET seen = 1 WHERE 
                                                    thread = :thread AND
                                                    receiver   =  :receiver 
                                                ',[
                                                    'thread' => $item->thread,
                                                    'receiver' => $sender->id
                                                ]
                                        );  
                                    }
                                }

                                if($item->thread == $thread){
                                    $is_active = "  border-left bg-light ";
                                }
                            @endphp
                            <li class="message-item {{$is_seen}} {{$is_active}}  "> <a href="{{url("messages")."/".$item->thread}}" class="message-link">
                                <div class="message-img active"><img src="{{ $item->product->get_thumbnail() }}" alt="avatar"></div>
                                <div class="message-text">
                                    <h6 class="m-0 p-0 ">{{$item->_sender->profile->username}} <span>{{$item->created_at->diffForHumans()}}</span></h6>
                                    <p class="text-dark m-0 p-0 ">{{ Str::limit( $item->body,28)}}</p>
                                    <p class="text-muted">{{ Str::limit( $item->body,28)}}</p>
                                </div>
                                @if ($count >0)
                                <span class="message-count">{{$count}}</span>
                                @endif
                            </a></li>
                        @endforeach
 
                    </ul>
                </div>
            </div>
            <div class="col-lg-7 col-xl-8">
                @if (!$chat_is_open)
                    <div class="message-inbox">
                        <div class="card-body text-center">

                            <img src="<?= URL::asset('assets/') ?>/images/empty-box.png" width="120"
                                alt="empty-box.png">
 
                            <h2 class="h3 text-center mt-4">No Active Message!</h2>
                            <p class="text-center mb-2">You have not selected any message. Select one message from your chat thread to start chatting!</P>                             
                            

                        </div>
                    </div>
                @endif
                @if ($chat_is_open)
                    <div class="message-inbox">
                        <div class="inbox-header">
                            <div class="inbox-header-profile">
                                <a class="inbox-header-img rounded-0" href="#">
                                <img
                                    class="rounded-0"
                                        src="{{
                                            $product->get_thumbnail()
                                        }}" alt="avatar"></a>
                                <div class="inbox-header-text">
                                    <h5 class="h6 mb-0 pb-0 "
                                    style="line-height: 18px"
                                    ><a href="/{{$product->slug}}">{{ $product->name }}</a></h5>
                                    <span style="line-height: 15px" class="d-block mt-0 pt-0" style="line-height: 10xp">
                                        UGX. {{number_format($product->price)}}
                                    </span>
                                    <span style="line-height: 15px" class="d-block mt-0 pt-0">
                                        Chatinng with <a href="/{{$receiver->profile->username}}">{{$receiver->profile->company_name}}</a>
                                    </span>
                                </div>
                            </div>
                            <ul class="inbox-header-list d-none d-md-flex">
                                <li><a href="#" title="Delete" class="fas fa-trash-alt"></a></li>
                                <li><a href="#" title="Report" class="fas fa-flag"></a></li>
                                <li><a href="#" title="Block" class="fas fa-shield-alt"></a></li>
                            </ul>
                        </div>
                        <ul class="inbox-chat-list" id="inbox-chat-list">
                            
                            @foreach ($inbox as $msg)
                                @if ($msg->sender == $sender->id)                                
                                    <li class="inbox-chat-item">
                                        <div class="inbox-chat-img"><img src="{{ URL::asset('/assets') }}/images/avatar/01.jpg" alt="avatar"></div>
                                        <div class="inbox-chat-content">
                                            <div class="inbox-chat-text">
                                                <p>{{$msg->body}}</p>
                                                @if (!$msg->seen)
                                                    <i title="Not seen" class="fas fa-check ml-1"></i>
                                                @else
                                                    <i title="Seen" class="fas fa-check-double text-primary ml-1"></i>
                                                @endif
                                            </div>
                                            <small class="inbox-chat-time ">
                                                {{$msg->created_at->diffForHumans()}}
                                            </small>
                                        </div>
                                    </li>
                                @else
                                <li class="inbox-chat-item my-chat">
                                    <div class="inbox-chat-img"><img src="{{ URL::asset('/assets') }}/images/avatar/02.jpg" alt="avatar"></div>
                                    <div class="inbox-chat-content">
                                        <div class="inbox-chat-text">
                                            <p>{{$msg->body}}</p>
                                            <div class="inbox-chat-action"><a href="#" title="Remove"
                                                    class="fas fa-trash-alt"></a><a href="#" title="Forward"
                                                    class="fas fa-forward"></a></div>
                                        </div><small class="inbox-chat-time">{{$msg->created_at->diffForHumans()}}</small>
                                    </div>
                                </li>  
                                @endif
                            @endforeach
                        </ul>
                        @php
                            $messgae_url = url("messages")."/".$thread;
                        @endphp
                        <form 
                            id="message_form"
                            autocomplete="off"
                            action="{{$messgae_url}}"
                            class="inbox-chat-form"
                            method="post"
                            >
                            @csrf
                            <input type="number" required name="sender" hidden value="{{$sender->id}}">
                            <input type="number" required name="receiver" hidden value="{{$receiver->id}}">
                            <input type="number" required name="product_id" hidden value="{{$product->id}}">
                            <input type="text" required name="thread" hidden value="{{$thread}}">
                            <input type="number" required name="ajax" hidden value="1">
                            <input
                                autofocus
                                autocomplete="off"
                                required
                                class="border"
                                type="text"
                                name="body"
                                id="message_body"
                                placeholder="Type a Message "
                                /><button type="submit"><i class="fas fa-paper-plane"></i></button>
                        </form>
                    </div>
                @endif

            </div>
        </div>
    </div>
</section>

@endsection

@section('foot') 
<script src="{{ URL::asset('/assets/js/vendor/nicescroll.min.js') }}"></script>
<script src="{{ URL::asset('/assets/js/vendor/nice-select.min.js') }}"></script>
<script src="{{ URL::asset('/assets/js/vendor/emojionearea.min.js') }}"></script>
<script src="{{ URL::asset('/assets/js/vendor/forms.js') }}"></script>
<script src="{{ URL::asset('/assets/js/custom/nice-select.js') }}"></script>
<script src="{{ URL::asset('/assets/js/custom/nicescroll.js') }}"></script>
<script src="{{ URL::asset('/assets/js/custom/emojionearea.js') }}"></script>
<script>

$(document).ready(function() {
    $('#inbox-chat-list').scrollTop($('#inbox-chat-list')[0].scrollHeight);
    const message_body = $("#message_body");
    const messgae_url = '<?= $messgae_url ?>'

    message_body.keydown(function (e) { 
        if(e.keyCode == 13){
            //send_message()
        }
    });


    $('#message_form').ajaxForm(function(resp) {
        message_body.val("");
       const resp_data = JSON.parse(resp);
       if(typeof(resp_data.status) == "undefined"){
           alert("Failed to send message. Please try again.")
           return;
       }
       if(resp_data.status != 1){
           alert("Something went wrong while sending message. Please try again.")
           return;
       }
       const msg_body = JSON.parse(resp_data.body);
       const element = '<li class="inbox-chat-item">\
                            <div class="inbox-chat-img"><img src="<?= URL::asset('/assets') ?>/images/avatar/01.jpg" alt="avatar"></div>\
                            <div class="inbox-chat-content">\
                                <div class="inbox-chat-text">\
                                    <p>'+msg_body.body+'</p>\
                                </div><small class="inbox-chat-time">'+msg_body.created_at+'</small>\
                            </div>\
                        </li>';
       $('#inbox-chat-list').append(element);
       $('#inbox-chat-list').scrollTop($('#inbox-chat-list')[0].scrollHeight);

    });

 
   
});
</script>
@endsection
 