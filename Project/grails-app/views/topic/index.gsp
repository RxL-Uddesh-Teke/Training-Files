<%@ page import="com.rxlogix.Subscription; com.rxlogix.User" %>
<%--
  Created by IntelliJ IDEA.
  User: rxlogix
  Date: 26/7/21
  Time: 8:50 PM
--%>

<%--
  Created by IntelliJ IDEA.
  User: rxlogix
  Date: 26/7/21
  Time: 6:20 PM
--%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Link Sharing App</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style >
    #div{
        color: blue;
        border-radius: 10px;
        border-width: 1px;
        border-style: solid;
        border-color: black;
        width: 100%;
        padding: 10px;
        margin: 5px;
    }
    #border1{
        border-radius: 10px;
        border-width: 1px;
        border-style: solid;
        border-color: black;
        padding: 10px;
        margin: 5px;
    }
    </style>
</head>
<body class="container">
<h2 style="text-align: center;"> Grails Home Page </h2>
<div style="border-color: black;">
    <div class="row" id="div">
        <div class="col-sm-6"><h2>Link Sharing</h2></div>
        <div class="col-sm-6">
            <div class="row" style="float: right;">
                <div>
                    <input type="text" placeholder="Search..">
                    <i class="fa fa-search fa-lg" style="color: black;" aria-hidden="true"></i>
                </div>&nbsp&nbsp
                %{--&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp--}%
                
                <button type="button" class="btn" data-target="#shareResource" style="width: 40px;" data-toggle="modal"><i class="fa fa-link" aria-hidden="true"></i></button>&nbsp&nbsp
                <div class="modal fade" id="shareResource" role="dialog">
                    <g:form class="form-group" controller="resources" action="createLink">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">Share Link</h4>
                                </div>
                                <div class="modal-body">
                                    <form>
                                        <div class="form-group">
                                            <label for="url" class="col-form-label">Link</label>
                                            <input type="text" class="form-control" id="url" name="url" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="description" class="col-form-label">Description</label>
                                            <textarea class="form-control" id="description" name="description"></textarea>
                                        </div>
                                        <div class="form-group">
                                            %{--<label for="message-text" class="col-form-label">Message:</label>--}%
                                            %{--<textarea class="form-control" id="message-text"></textarea>--}%
                                            <label for="select-text" >Topic</label>
                                            <select id="select-text" name="topic" style="width: 100px;" required>
                                                <option value="${topic.name}">${topic.name}</option>
                                            </select>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">Share</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                </div>
                            </div>
                        </div>
                    </g:form>
                </div>
                <button type="button" class="btn" data-target="#shareDocument" style="width: 40px;" data-toggle="modal"> <i class="fa fa-file" aria-hidden="true"> </i> </button>&nbsp&nbsp
                <div class="modal fade" id="shareDocument" role="dialog">
                    <g:form class="form-group" enctype="multipart/form-data" controller="resources" action="createDocument">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">Share Document</h4>
                                </div>
                                <div class="modal-body">
                                    <form>
                                        <div class="form-group">
                                            <label for="document" class="col-form-label">Document</label>
                                            <input type="file" class="form-control" id="document" name="document" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="descriptionDoc" class="col-form-label">Description</label>
                                            <textarea class="form-control" id="descriptionDoc" name="description"></textarea>
                                        </div>
                                        <div class="form-group">
                                            %{--<label for="message-text" class="col-form-label">Message:</label>--}%
                                            %{--<textarea class="form-control" id="message-text"></textarea>--}%
                                            <label for="select-text" >Topic</label>
                                            <select id="select-text" name="topic" style="width: 100px;" required>
                                                <option value="${topic.name}">${topic.name}</option>
                                            </select>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">Share</button>
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                </div>
                            </div>
                        </div>
                    </g:form>
                </div>
                <div class = "dropdown" style="width: 100px;">
                    <button type = "button" class = "btn btn-secondary dropdown-toggle" data-toggle = "dropdown">user</button>
                    <ul class = "dropdown-menu" >
                        <li><g:link class="dropdown-item"  controller="user" action="userPage">Profile</g:link></li>
                        <li><g:link class="dropdown-item" value="logout" controller="user" action="logout">Logout</g:link></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<div>
    <div class="row">

        <div class="col-sm-5" >
            <div id="border1">
                <div>
                    <p>
                        <b>Topic : "${topic.name}"</b>
                    </p>
                </div><hr>

                <div class="row">
                    <div class="col-sm-4">
                        <img src="https://grails.org/images/grails_logo.svg" style="border-radius: 20%; height: 120px; width: 110px;">
                    </div>
                    <div class="col-sm-8">
                        <a href="#">${topic.name}</a> (private)
                        <hr>
                        <div class="row">
                            <div class="col-sm-4">
                                @username
                                <a href="#">Subscribe</a>
                            </div>
                            <div class="col-sm-5">
                                Subscriptions
                                <a href="#">${com.rxlogix.Subscription.countByTopic(topic)}</a>
                            </div>
                            <div class="col-sm-3">
                                Post
                                <a href="#">${com.rxlogix.Resources.countByTopic(topic)}</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="border1">
                <div>
                    <p>
                        <b>Users :${topic.name}</b>
                    </p>
                </div><hr>
                <div class="row">
                    <img class="col-sm-4" style="border-radius: 20%; height: 120px;" src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBYVFRUVFRUYGBgYGhkYGRgYFRgaGBgYGBgZGhgYGBgcIS4lHB4rHxgYJjgmKy8xNTU1GiQ7QDs0Py40NTEBDAwMEA8QHxISGjQkJCE0NDQ0NDQ0NDQ0NDQxMTQxNDQ0NDQ0NDQ0NDQ0NDE0MTQ0MTQ0PzQ0NDQ0ND8/NDQ0Mf/AABEIAOEA4QMBIgACEQEDEQH/xAAcAAAABwEBAAAAAAAAAAAAAAAAAQIDBAUHBgj/xAA8EAACAQIEBAQEAwYGAgMAAAABAgADEQQSITEFQVFhBiJxgRMykaEUscEHM0JScvAWI0NigtEVsiQ1VP/EABoBAAIDAQEAAAAAAAAAAAAAAAACAQMFBAb/xAAnEQADAAICAQQBBAMAAAAAAAAAAQIDEQQSISIxMkFRBTNCcRM0gf/aAAwDAQACEQMRAD8AruI47JoupnK8XolgXlk663LRxqSMLFhPQ5ITnqZMV1ZxKDUxTSZxHDBGNjcGQyZjXLmtM0JapbQBCMK8BMQYIrElYoGAntDQ2xBEAEVaEbxdBsdpNYzsvBnEbPkOzbTiZdeHsTkrIcpPKwnTgfq0U5p3LNNxC87aSiwuHAquTfUD7EyQeMPaxpHtqLgXkPEYtw+daR5ixddzaaaWjOlbL2nSBswNiNNBHqNBg2jHfW9vbSc83EcQBZaKAHq99Iqnj8QAS6KBYkEG97DaGtlqR0KUwLknrr6yPXwdzcNpb6yqbFYmy3VQCLrc6Ed7c5GetimGjIBtYAyVOiW9k9sEA1yTf7RQwajlcykapiSfnHraLRcSTpUA9pZtiNFi+E103HWG2FkD/PF2Lgnp1iKbvUJGcqBvbrGQaLjDUyjAg850Bo3AM4dsK9/3jfWWnDM5OR6rWO2sW5dSxGkqVfg6ekmklLUI2b7ylHB7f6j/AFgbhdtQ7TleOajrXlA8lK3UvTEeLHd6LKyqbag85kTAgm4mw8ZwSFQXY/LtfczK+MYRkc3UqCfLfmJnZMGKFuPGzTxcjJfpr6IObtBB7QSjRedStAFwhJtLJOHJIrp/mKRLXaegZgZLaW0QeJ8JRqRKjzCcQyWJHSaQ76WtoZxPHMLkYkDQzi5WLx2RbwuQ6fWiqtCcQF40zTPb0ayBeGGibQGK2MGXgzRLGGBeRsjQd5M4Y4FRGJAGYa3tzkFhBePFuaTIqdrRqKsCBb2N7+kM1TcCxOtrHnM+4fxmpR0U5l/la9vbpO14LxBKyZxcMDYjcD9bb6zVxZ5v+zgvBUf0WyqSAG02BsBYbc+l7xWKpqqFiRbY3OliOQ5ExNOrlzeawF/+R+ljrraGyXAuflNt9AvYc+csewXgYweHWoGJdyFKhb3AygDQD1vJ9bAqirl56yLgaeZEI1udrnQXN795bYxgEvb5bf2YLZVkvrST+ymqYSwDAXvrpGvhmwP2klqofzAnuBsYKaljePtpeS3WyHUoMQTa19oxw2iSzaazoKq6KSLi1pXYUDO1tIK3oTqMVk1tEqcjKeksUoAgneNV8KbS1Vv3Kmi6w1cOosbw62IVLX3OwlVwuoUvm9h3nXeHvD5civXH9C8gJx8rKsa0Tgwu639Ejg/C0rMHdb5RoDtKf9pPg38TTWpRXzpoFGmk7+nSVflFoqrWCqWY2AmPVNvZrKUeaf8ACGN//O/0gm//AOJcP/N9oJGxjHMZRysslgSPUdyPMATyi0p1T0noEzzmSXS1skLTJiOJ8GFSmeoEWMQ6Lyv1hOlRgSX+kW/UtDYMaiu2zM69MozKeRtGjLHjVApVYE353laBMbIutNG/D2tgEJ94/RpZv7+8XWoaZhy0YcwRpKtj6I1oEWS6dLMCLEG2Ze4vZt+UXSwpOu4Oh7dCPpI2GiGaZvbrqPTeJqIQbGW34JlAZbEIFctf+B8ilbcypbWSF4Q7uygG2oFxY6Izj6ZSPaL3SGUtlBaWvh7iTUKhtfK4CuNNr7juIheHMGysLEA3voLi5sfYRKYJldO5HK+t1uCP+Ql2G9WtCXPh7NEXFUkIu6jc6nY9rRNTidC1gyuf6hp0J+wjeBo0giMyLfKtxkXTTnp95Np4YPlCJfobLv300m4ZlNT7kPhuNpqVTMCL3JDHTW9tJb1+JUrWLH2B1hNQCeWw7+vaEigHaXzC1sxORyJq9+dIqW4pSQnyO19vKQPWAceUaCm9uuWW9airLtrykVqRFtLi8WpNDj8qLny9Mb/88rCyU3PtaMJiCpZ8ja8pdrTFhZdeRjDkk2I0lcnVVFfS4qyiwon3ijxViL5NekdxdYXAHKFw/Dms2VBdryzamXTKU23r8lz4VwTYhw7U/KuvvNIRiABlsJG4NgBRpqoGttfWPcQDfDbKbEAke0wc2V5K2zUxwpnSHcx52lB4h8UYegpV2U9rzI+O+NMVnemHtlJFwZymIxDuczsWPcyhlspmxf4zwP8AKv2gmOXWCQPo7+wIhhrbGQ6eZdwbRaVrneej6s871Yqu5tJGGreXWQKlS5KjWBahAt9odSZmjmPFif5uYA2I+/aUAE6jxGmbK3YznQmvWY3JnrkZs4H6EOZNLg9AY/RNy5tuhB/qA/W0TRUW1Ha15Y4WpZXJHmIGunmsRmuOeg5dpy0dCE4ZQqI4/gbMOhRvnQj2P1kpMAEzjcXOTf5RlYFet0Yn/iJIwCZnp7EKVsLaFQwvfrcMRf8A2y9oYcOikZfLqDax1zqB6BCD6I0pqhkiipYM/hXQjzCrlQkeYqdCvddRp2nd4XheTNUyHVDr0vdQSOYsPbNK3hfDHquqkkqrs5tyDEsAGttdyeuo6TuVoZU1OtrSm68lkmbJwYO9JQw8tPPUI1Llrs3/ALD+xEU+Dtm8wsbllNtrCyj7AzpMZxKlSbKgLMDoEBJ2tbSIxFKu6GsVCKqk20JvbQW6ycV0rRNpdWV/DadFkR75r65TZRp1GvQS2XEWAVQFAtovT15yiw+AKgEOLADn1A5X19r7RxRk1D+3X2nro1pb8nleTxrreq/4WNTeJiaNTOt9u0UEJnStaMW5cPVBsxtaNDEgaXjeMdhou5kRFN4tex28Tiq12fsWIxjkkKOUjVKrXIJjyGwvtEVHBUDLduspS8mupmVpEBmsSes6/wDZ7gAxaoeWk5f4RJC235TTeAYZMNh1zkKW1NzacnNzOZ6r7L8EKnt/R0AEqfE3Elw+GqVGI+UgdyRKfxF47w2GQ2cO9tAOsxjxL4tr4xjmYhOS/wDcyDvRT4mrnd3P8RJjZMTmhZorHDghZoIEmsfhgd9ZDxHDhuuhj2EJVtTcWkdqeZicx32nplXq0ecW1PbZVnCujNf6xlKgsSTr3Mu6+HRVJdja3WcFxzFoHtSJsO/OReWYW2X4E8j0h3xFjQSoUg2vcSsSjsRsdB7neQHNzeWfB6+uRttSPXmJh57/AMlOjVies6JmHoFntawU3PTTv7yzFBDoXXnpmAve/wDftGFpjzENuD636fW00Lwl4LwqYdHr0/iVnTOQTot9gBOHLSleToidnLcKwwBQi3p6aiXGFoZFy38pYAi++QOV162Yj3M6rC8GwqlkyBCLaBj5S9yAO/lOkrMXwR0qZVN03B/77j9Zz90yxzov+F0FRFCC2l/UxWKsVOdsq87bwcOpsECnlF4vCF1IiNjI5biNe1OouGosptZahC5SeZ1N7d7Sw4FiGqUVpkgjnzJ63POM8Q8MmohXO6joGIB9RzhcM4MUTIHyNtc6ED15Rd7H0iBxjDHDKzKC9MW6XQcxb+X8pQVuKhwCo9Bp1nfYimlOm/4itTyBTcswuVtr6zB6OOKPdSSoY5b/AMtzl+1pvfp3MfXrf19mfyuOt7k7alj3D3Cb95dYfGta+Wc/gMUKgzj3l5w62Ug+s3lSpHnOZgXvryisxWOqsxyqLcpFFbEX2En1GuzERAUyToxemEktEZ8bUNluMx3jq/EBBLyP8K1STHNja8GkizbZaeHsE9XEp5tjcyN+07jlRMQKCOcqjkZ2HgLChUeseQvMk8ZYv4uLqP0Yj7zz/Jt1bNLDOpSKStUZjdiT6xN4GiQZzM6ULiYWaANIJDtBCzQQINXYgAmVT8URASWEoeMeJC11Scy1VmGpJmvedS/BmY+M2vUXPGvEDVbqpsv5zn3hkxDGcWTJVvbO2ImFqQjFoxBBBsRqI2YoCUFui2w2NLG3Wa/4S4n8WgozWdFKddjdTbmBzHQ9ph+GqZXU95qfhamU819yD9txOXkrwX4S+xuJxzVAfwVF6aMjeSuufT+LOetzpa9p1b5WAPp0kfAZACwXVvmI0J9esbz5TbYTi2XMnoto/QFt5GoveSgRG2RoRjcSqIWI22A3J5Ae85PGcMau1q1dKIsHKmqF0YkA9Tseg7mW/GMOtRcjaqSLjrOffwzhkBZFC21AyhvoTImpb8hp/TMr8ZV1OJamhDJTOVGGbzAgHN5tf0lA0vPGFEriCxFgyqV9hY/lKMzUjXVaOW97LLhHEDTYa6HcTtsNiyQGXYiZvedT4W4l/pudOV5q8Pkfxo4OTgVLsdAYoA20jwqoP4hCOKQHeaezi6sraynOJOXDg6xFWshaTcHkLC7SMlehkxL2dtw1xhsA7sdx+kwzGPnd3/mYn7zSvH/G1GHTD0zvvaZdkM83T8s1oQxVNo2rxVdbGNWijhs8JbkxxEjb/MLQAXBJf4YwQAiFxGmMfAiHEuYiGTBDMJYjGQUEMw0p3IEVkh0KZZgoF9R9JrnBFORb9BOQ4RwuxAC22ues0HAYcKonHntNaR0Y50X2AfSS6lK4lZhaliBL2klxORFrICMVjrY0SS2HErcS9jZR6mDRGx0VFbeRuJY3DUkLVXRVHVgPtuZnnjfjuIpsqJVKZrk5QAco0GtrjW/0nA4hi7FmYserMSfqZdj4/ZbbK6ydSx8W8YGKxBdFsijKl9yL6sRyv0lGR2kjLCyzvlKVo529+SPHcO1iDFZYlk5yyK6tMVraNAwOFR0VhfbrHDhFHKV/guvnUoeU6KtSAm3iydkmZ2SerKtsKvSMvSCAttbvJ5AEp+OYnKhl2TSxsqjbpIpOJYsu977SNU2kem1xcwVK+lhPOV5ZrytIbXUxxUjdIayZTS+p2kEjVQ5Rc+0hhTcMeZEnonxXt/CsTibG9tgQBACz+GesEP4naCAFL7wniLwFpdsTQ2xiVimhKJWxkGokikLa9DGg0WGkEmpeHaqV6autgy6OOYb/AKnS0KXKY1wnib4dxUpnXZlJ8rDow/Wal4f8YYasAGb4b80fYn/a2x/OZ2bFSe17HRNJovBRtrLbh9W4kdHQjSO8OSxYe4lHsWbJVWtbbeVOPIRGdzYWLMTyHMx/iXGcLhwWrVkQjXLe7+gRbm/tMp8ZeMHxt6dMFMODz+d7bFug7S2MdW9IWqU+TnON8QOIr1Kp+U+VAeSL8v11PvK4LHyL+kQw1mjM6Wjlb2xOXSNgRy0UojANZY9SpxzJHKawAe4JXNKqCNjoZoT4dnUMOYmcW1nX8K4zUZAoGwmjw7/icmeftFj+AYzjPFr5TlnS1OJVNZwXG8Sz1CWl/LyOY1+SrjwnWyMr2WNLDJj1JJjGgKojWSaraWG52iStiJLwdK7Zjy2gAbWo0v8AcdPcyHUp2pjrufrHOJMWZQdhF1h5LdoAOfEXpBIObvBACG3rAB3hkaRSppLH4FEkQwsVljqUyYjYDSreOJSjqpaLtaAwkJaKNOJ3McA0kaI2TMJxXEU9KeIdR0Dm30Okmr4lxgBH4qoL6GzAaeoH5SoBirf3aL0n8Ddq/IW5ubsTqSTe59TDK33+kVaHaMkl7C7bGwusQy6x5ecSskkjkQ1jpW5hBIAOKYtREKsWggAdpbcCxWRyt95VsIlHysCJbgrraZXc9paOqrt85vymf497u3rOyeofhE9pw+Ia7Me87edXhaKONOthJqZYIm0h4SkWOkskpETMOsFQarJ1BbAxn4d2STEWSBXcRGVk7xVV/KBC4tunvEuLkQAjZYJNyjpBACoVZIpL1jKDWSEjMXYTU7HTUbx9D6aRRTSIHpFDYRN4GMcYX5RBWABAd4pRAEhoIAGBrFCJtFQAWpgYwLEs0CdAtpAFilUkWAvYXPoIAml+9oEiQITSaMA+hVSRa97f9yKy66wFDUQKdYAdIQOsAFudRGmGsUdxEt80AJ34r/LZTOWc6mXdY2UyiJ1Muy5e0pfgWJ6tlzwSle8fq6MRHOCpZLwuICzCUDC2NshktWEgObpf+UybRa6gwAqeMtZ0HaScOh+Y+0hcUJNZQeglo+gEkYZuekEXlMECClw+up6yUEsZHww8uvWS9xAgQDY2PPaLO94jN/C3tBTG4PrANDzttCIhjaG0AEERYESo3MtKXCXdEdFOUi7O9kRSDa2d7A8tBeAFYRHKdFmzZRfKMx9LgfrLl8DSRw71l6hKaZ/4RcZmyjY8gYyMbQp/u6JckWLVHLdf4VCqRtuDAC2pUjhB8JWZKps1ZwBtYEU0LCzICRmI0JG9hF8awtMor1PhU6pZWXIhDhP5qiIMhLaEXAIGvOVh8TYnygOMibIURkHojDKOR0Eo8TXZ3Z3YszEsSTqSTcmTvxoYuKlXDIxYB3Y3vchFF+y6/eJHFAoISmif8QT9TKkxamQBNrcQqNpm07aflIPOLJiFgAbCIvrHDtGC2sBR1T5ogHUyRSoMflUn2Ms8B4YxFQ6IQDzIiVcr3Y0y2VOW4IlJiaeV7TU08FFELOdbTNOKUytZlPIxZyzT0hnLXkt8ALIJIxKBrGRqDWQSZ8wFpYVkUUrBl5MI5w43X00kl08tpG4bpnv1gBU4vzYj0IltVO0qKbZq7HvLmryPKAwiCI+IO8KBBUYQ/MO8kvpqP7Ej4ZdZKAP0kkMQ6A94FOxvcXt31h3sbRL0ybldDz6GAIkEa2gSJTlFrACThcS1IlksD1KhvzGnqNYVbGO5u7sxtbUnbXT01jFRtIKe14EoDQAwExrEVAoJP9mBAhMUC5X6Q+chYH5ix7ybTO8Bh60UIUAYcjAXyG5hJAxgQQAcCxtbB1J1FxePrGKg1kMlGz+FsLQemrZBe06UqqjygD0ma+AeLjLkJ1E0IVriZWVNU0ztjTWyBxQ3BEwvxPQy4ojrNwxjTGvFy3xmnSPxfkLlXpGaS3Fu0XgqtjkbTpDRMo1iaiB9tCNjNI4yyCSvo1MpqD1/KChjGQ5XHoZBxmJAapY7j85AEPhwzVCZdYltLSp4MPMTLLEtGJY1BE27woaIIeFEkE6xmmI8IBoRUW+otpAjRe3X6RIHrABSNrb3joWV9StaoOg0PvLK2kAGq7aRykDlB95FrPmIUR7EVQi9+QkMAqtcLrKrE1i5uYK1QsbkxomQxkhSmOrXI2jSSWKabk6dpIDDV3aScEjhrnbvAMWi6KvvD/8AInpACeYaSJRxQY25yYgkgOiMVN5JCyLVN2EgUcwXEWoOHB0vrNh8N8S+KgPUTHEw2dlXqRNf8NYPIigdBOHkpJnXh9ixxyzGvFxKYokC5I/WbLjWmOeNKn/yT6ReP8hsvxKWpXYnzvbsIBxHJ8gv3MbwuHDvY6yxfhyILzQOQiDibtoy39pBxQbN5lK35GWLsdkH2kTHsxyhmuRAB/hQ3lhijaQuE6C8k4rUwQDWbvBF2HSFJALw3hVqsUckDkRuJfVPCVQ/u3Vh0OkqOC0GpPZuc73huK7zn5NXjrRbjmaRyL+F8Uv+iSOxBjNfgddBmemyL1bSaZU8TUaCXdxfoDOH4rx58f8AHZRZEXyjr3jca7ukmvAuWZlb2cRj2BdiosIupjCVA+sikbwgZfT3WytLwPUqhXURDuSbkwoIpIRiYZhSGSLAgKk7awCdV4R8NPWqKzqQmhsdMwvFqlK2yZl0/BzYwjaZha/XpHVwJPOaH+156VNcJRRVWooZ2C8kOig+pB+kzj8c3b6Qh7Wwpaeh+ng7EG8saYlUmOOxltRWy+scUWz2kVdWjrRumN4CjuHqWYHoRNs4EQaCN1UTDkE1vwNjw+FC31TScvKnxsvw150T8fVtczGvFFQtiWJFprGPu7ZVmc+OcNkqJ1tOjicdLE7r3ZXmzetSjncNiMhNt5NpU3c3IJ7R/wAP8KSs/mOgmp8J4TSQAKg9SJVeaY8DTideTPMJ4er1yAEKjra0pfFPBhhaop3JuoNz1m8LoLTMf2t4az0XHMERMeZ1Wh6hSjk8Clli8S+oEPCpoNYVVLMt51lDFZTDkr8NBAgMfOsvafymCCJ+pfulnG+COM4z8xk7wv8ALX/pP5QQRuH7oXk/EoKnzH1jZggk17gvYMQ4IJABNCMEEhkkzhX7xfX9ZvPh7/S/pEEE5eR9F2Iyn9qn/wBjX9E/9BOREEE6MfxRXfyAJ0S/KvoPygglggh94VLnBBAVgXnO/wD2bfJV94UE5+T8C3F8jpMP85mdftK/erDgnfi/11/RyX+8RPBXzGangNhBBMbP8jTx/EsJnv7Xfkof1H9YIIYPkhcnscXhdhBifnWCCaJzFtBBBAg//9k=">
                    <div class="col-sm-8">
                        <div class="row">
                            <div class="col-sm-12">
                                <b>Uddesh Teke</b>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                                <a href="#"><i class="fa fa-facebook"></i></a>
                            </div>
                            <div class="col-sm-12"><a href="#">@uddesh</a></div><hr>
                            <div class="col-sm-6"><a href="#">Subscriptions</a></div>
                            <div class="col-sm-6"><a href="#">Topics</a></div>
                            <div class="col-sm-6">50</div>
                            <div class="col-sm-6">30</div>

                        </div>
                    </div>
                </div> <hr>

                <g:each in="${com.rxlogix.Subscription.findAllByTopic(topic).user}">
                    <div class="row">
                        %{--<img class="col-sm-4" style="border-radius: 20%; height: 120px;" src="${it.photo}">--}%
                        <asset:image src="${it.photo}" class="col-sm-4" style="border-radius: 20%; height: 120px;"> </asset:image>

                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-sm-12">
                                    <b>${it.firstName}</b>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-linkedin"></i></a>
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                </div>
                                <div class="col-sm-12"><a href="#">@${it.userName}</a></div><hr>
                                <div class="col-sm-6"><a href="#">Subscriptions</a></div>
                                <div class="col-sm-6"><a href="#">Topics</a></div>
                                <div class="col-sm-6">${com.rxlogix.Subscription.countByUser(it)}</div>
                                <div class="col-sm-6">${com.rxlogix.Topic.countByUser(it)}</div>

                            </div>
                        </div>
                    </div> <hr>
                </g:each>
            </div>
        </div>

        <div class="col-sm-7">
            <div id="border1">
                <div>
                    <p>
                        <b>Posts : "Grails"</b>
                    </p>
                </div> <hr>

                <div class="row">
                    <div class="col-sm-3">
                        <img src="data:image/png;base64,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" style="border-radius: 20%; height: 120px; width: 110px;">
                    </div>
                    <div class="col-sm-8">
                        Contrary to popular belief, Lorem Ipsum is not simply random
                        text. It has roots in a piece of classical Latin literature from
                        45 BC, making it over 2000 years old.
                        <div class="row">
                            <div class="col-sm-2">
                                <i class="fa fa-facebook" aria-hidden="true"></i>&nbsp&nbsp
                                <i class="fa fa-twitter" aria-hidden="true"></i>
                            </div>
                            <div class="col-sm-10" style="font-size: small">
                                <a href="#">Download</a>&nbsp&nbsp
                                <a href="#">View Full site</a>&nbsp&nbsp
                                <a href="#">Mark as Read</a>&nbsp&nbsp
                                <a href="#">View Post</a>
                            </div>
                        </div>
                    </div>
                </div> <hr><br>
                <g:each in="${com.rxlogix.Resources.findAllByTopic(topic)}">
                    <div class="row">
                        <div class="col-sm-3">
                            <asset:image src="${it.user.photo}" style="border-radius: 20%; height: 120px;"> </asset:image>
                            %{--<img src="${topic.user.photo}" style="border-radius: 20%; height: 120px; width: 110px;">--}%
                        </div>
                        <div class="col-sm-8">
                            ${it.description}
                            <div class="row">
                                <div class="col-sm-2">
                                    <i class="fa fa-facebook" aria-hidden="true"></i>&nbsp&nbsp
                                    <i class="fa fa-twitter" aria-hidden="true"></i>
                                </div>
                                <div class="col-sm-10" style="font-size: small">
                                    <a href="#">Download</a>&nbsp&nbsp
                                    <a href="#">View Full site</a>&nbsp&nbsp
                                    <a href="#">Mark as Read</a>&nbsp&nbsp
                                    <a href="#">View Post</a>
                                </div>
                            </div>
                        </div>
                    </div> <hr><br>
                </g:each>
            </div>
        </div>
    </div>

</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
%{--<-- Always remember to call the above files first before calling the bootstrap.min.js file -->--}%
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

</body>
</html>