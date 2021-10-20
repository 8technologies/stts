@extends('layouts.layout')

@section('title', 'Page Title')

@section('head')
<link rel="stylesheet" href="{{ URL::asset('/assets/css/vendor/nice-select.min.css') }}">
<link rel="stylesheet" href="{{ URL::asset('/assets/css/vendor/emojionearea.min.css') }}">
<link rel="stylesheet" href="{{ URL::asset('/assets/css/custom/message.css') }}">
@endsection

@section('content')
{{-- 
    

    <link rel="icon" href="images/favicon.png">

    <link rel="stylesheet" href="css/custom/message.css">

    --}}
<section class="message-part">
    <div class="container">
        <div class="row">
            <div class="col-lg-5 col-xl-4">
                <div class="message-filter">
                    <div class="message-filter-group"><select class="select">
                            <option value="">all message</option>
                            <option value="">read message</option>
                            <option value="">unread message</option>
                        </select><button class="message-filter-btn"><i class="fas fa-search"></i></button></div>
                    <form class="message-filter-src"><input type="text" placeholder="Search for Username"></form>
                    <ul class="message-list">
                        <li class="message-item unread"><a href="message.html" class="message-link">
                                <div class="message-img active"><img src="{{ URL::asset('/assets') }}/images/avatar/01.jpg" alt="avatar"></div>
                                <div class="message-text">
                                    <h6>miron mahmud <span>now</span></h6>
                                    <p>How are you my best frie...</p>
                                </div><span class="message-count">4</span>
                            </a></li>
                        <li class="message-item"><a href="message.html" class="message-link">
                                <div class="message-img active"><img src="{{ URL::asset('/assets') }}/images/avatar/03.jpg" alt="avatar"></div>
                                <div class="message-text">
                                    <h6>shipu ahmed <span>3m</span></h6>
                                    <p><span>me:</span>How are you my bes...</p>
                                </div>
                            </a></li>
                        <li class="message-item unread"><a href="message.html" class="message-link">
                                <div class="message-img"><img src="{{ URL::asset('/assets') }}/images/avatar/02.jpg" alt="avatar"></div>
                                <div class="message-text">
                                    <h6>tahmina bonny <span>2h</span></h6>
                                    <p>How are you my best frie...</p>
                                </div><span class="message-count">12</span>
                            </a></li>
                        <li class="message-item"><a href="message.html" class="message-link">
                                <div class="message-img active"><img src="{{ URL::asset('/assets') }}/images/avatar/04.jpg" alt="avatar"></div>
                                <div class="message-text">
                                    <h6>nasrullah <span>5d</span></h6>
                                    <p>How are you my best frie...</p>
                                </div>
                            </a></li>
                        <li class="message-item"><a href="message.html" class="message-link">
                                <div class="message-img"><img src="{{ URL::asset('/assets') }}/images/user.png" alt="avatar"></div>
                                <div class="message-text">
                                    <h6>saikul azam <span>7w</span></h6>
                                    <p><span>me:</span>How are you my bes...</p>
                                </div>
                            </a></li>
                        <li class="message-item"><a href="message.html" class="message-link">
                                <div class="message-img active"><img src="{{ URL::asset('/assets') }}/images/avatar/02.jpg" alt="avatar"></div>
                                <div class="message-text">
                                    <h6>munni akter <span>9m</span></h6>
                                    <p>How are you my best frie...</p>
                                </div>
                            </a></li>
                        <li class="message-item"><a href="message.html" class="message-link">
                                <div class="message-img active"><img src="{{ URL::asset('/assets') }}/images/avatar/03.jpg" alt="avatar"></div>
                                <div class="message-text">
                                    <h6>shahin alam <span>1y</span></h6>
                                    <p>How are you my best frie...</p>
                                </div>
                            </a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-7 col-xl-8">
                <div class="message-inbox">
                    <div class="inbox-header">
                        <div class="inbox-header-profile"><a class="inbox-header-img" href="#"><img
                                    src="{{ URL::asset('/assets') }}/images/avatar/01.jpg" alt="avatar"></a>
                            <div class="inbox-header-text">
                                <h5><a href="#">miron mahmud</a></h5><span>active now</span>
                            </div>
                        </div>
                        <ul class="inbox-header-list">
                            <li><a href="#" title="Delete" class="fas fa-trash-alt"></a></li>
                            <li><a href="#" title="Report" class="fas fa-flag"></a></li>
                            <li><a href="#" title="Block" class="fas fa-shield-alt"></a></li>
                        </ul>
                    </div>
                    <ul class="inbox-chat-list">
                        <li class="inbox-chat-item">
                            <div class="inbox-chat-img"><img src="{{ URL::asset('/assets') }}/images/avatar/01.jpg" alt="avatar"></div>
                            <div class="inbox-chat-content">
                                <div class="inbox-chat-text">
                                    <p>Omnis dolorum tempora consequatur</p>
                                    <div class="inbox-chat-action"><a href="#" title="Remove"
                                            class="fas fa-trash-alt"></a><a href="#" title="Forward"
                                            class="fas fa-forward"></a></div>
                                </div>
                                <div class="inbox-chat-text">
                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis dolorum
                                        tempora consequatur. Deleniti nisi libero!</p>
                                    <div class="inbox-chat-action"><a href="#" title="Remove"
                                            class="fas fa-trash-alt"></a><a href="#" title="Forward"
                                            class="fas fa-forward"></a></div>
                                </div><small class="inbox-chat-time">feb 02, 3:15 AM</small>
                            </div>
                        </li>
                        <li class="inbox-chat-item my-chat">
                            <div class="inbox-chat-img"><img src="{{ URL::asset('/assets') }}/images/avatar/02.jpg" alt="avatar"></div>
                            <div class="inbox-chat-content">
                                <div class="inbox-chat-text">
                                    <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quo dolore animi
                                        dolores autem assumenda fuga consequuntur, laboriosam laborum minus
                                        provident error officia quasi atque deleniti.</p>
                                    <div class="inbox-chat-action"><a href="#" title="Remove"
                                            class="fas fa-trash-alt"></a><a href="#" title="Forward"
                                            class="fas fa-forward"></a></div>
                                </div><small class="inbox-chat-time">5 minutes ago!</small>
                            </div>
                        </li>
                        <li class="inbox-chat-item">
                            <div class="inbox-chat-img"><img src="{{ URL::asset('/assets') }}/images/avatar/01.jpg" alt="avatar"></div>
                            <div class="inbox-chat-content">
                                <div class="inbox-chat-text">
                                    <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit.</p>
                                    <div class="inbox-chat-action"><a href="#" title="Remove"
                                            class="fas fa-trash-alt"></a><a href="#" title="Forward"
                                            class="fas fa-forward"></a></div>
                                </div><small class="inbox-chat-time">5 minutes ago!</small>
                            </div>
                        </li>
                        <li class="inbox-chat-item my-chat">
                            <div class="inbox-chat-img"><img src="{{ URL::asset('/assets') }}/images/avatar/02.jpg" alt="avatar"></div>
                            <div class="inbox-chat-content">
                                <div class="inbox-chat-text">
                                    <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quo dolore animi
                                        dolores autem assumenda fuga consequuntur</p>
                                    <div class="inbox-chat-action"><a href="#" title="Remove"
                                            class="fas fa-trash-alt"></a><a href="#" title="Forward"
                                            class="fas fa-forward"></a></div>
                                </div>
                                <div class="inbox-chat-text">
                                    <p>Lorem ipsum dolor sit amet</p>
                                    <div class="inbox-chat-action"><a href="#" title="Remove"
                                            class="fas fa-trash-alt"></a><a href="#" title="Forward"
                                            class="fas fa-forward"></a></div>
                                </div><small class="inbox-chat-time">5 minutes ago!</small>
                            </div>
                        </li>
                    </ul>
                    <div class="inbox-chat-form"><textarea class="" placeholder="Type a Message "
                            id="chat-emoji"></textarea><button type="submit"><i class="fas fa-paper-plane"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

@endsection

@section('foot') 
<script src="{{ URL::asset('/assets/js/vendor/nicescroll.min.js') }}"></script>
<script src="{{ URL::asset('/assets/js/vendor/nice-select.min.js') }}"></script>
<script src="{{ URL::asset('/assets/js/vendor/emojionearea.min.js') }}"></script>
<script src="{{ URL::asset('/assets/js/custom/nice-select.js') }}"></script>
<script src="{{ URL::asset('/assets/js/custom/nicescroll.js') }}"></script>
<script src="{{ URL::asset('/assets/js/custom/emojionearea.js') }}"></script>
@endsection

{{-- 
 

    <link rel="stylesheet" href="fonts//">
    <link rel="stylesheet" href="css/vendor/">
    <link rel="stylesheet" href="css/vendor/emojionearea.min.css">
    <link rel="stylesheet" href="css/vendor/bootstrap.min.css">
    <link rel="stylesheet" href="css/custom/main.css">
    <link rel="stylesheet" href="css/custom/">
</head>
    
    --}}