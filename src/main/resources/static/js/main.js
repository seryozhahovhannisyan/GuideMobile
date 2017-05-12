var app = angular.module('mainApp', ['ngSanitize']);



app.controller("mainCtrl", ['$scope', '$http', '$window', '$rootScope', '$compile', function ($scope, $http, $window, $rootScope, $compile, $sce) {

$scope.lengtNgRepeat;
    $scope.get_urls = function () {

        var url = "url.json";

        $http.post(url, "").then(
            function (data) {
                // console.log("data", data);
                if (data.statusText == "OK" && data.status == 200) {
                    var result = data.data.actions;
                    // console.log("actions", result);
                    $scope.datas = angular.copy(result);
                    $scope.lengtNgRepeat =$scope.datas.length;
                    // console.log("$scope.lengtNgRepeat",$scope.lengtNgRepeat)
                }
            },
            function (data) {
                // console.log("data", data);
                $scope.status = data.status;
                $scope.statusText = data.statusText;
                $scope.data = data.data;
                if (data.data) {
                    $window.open($scope.data, '_blank');
                }
            })
    };

    $scope.inputObj = {};
    $scope.get_urls();

// console.log("$scope.inputObj",$scope.inputObj);

    $scope.add_request = function ( ) {
        var parent_parent_index = $scope.lengtNgRepeat;
        var newEle = $compile('<tr><td><input type = "checkbox" ng-click="updateSelection($event, '+parent_parent_index+')" ng-checked="checked.checked_all"></td>' +
            '<td><input type = "text" ng-model="inputObj['+parent_parent_index+'][\'url_\'+'+parent_parent_index+']" ng-init=" inputObj['+parent_parent_index+'][\'url_\'+'+parent_parent_index+'] = data[0].url;inputObj['+parent_parent_index+'][\'id\'] = '+parent_parent_index+' "  </td>' +
            '<td><input type = "text" ng-model="inputObj['+parent_parent_index+'][\'method_\'+'+parent_parent_index+']" ng-init=" inputObj['+parent_parent_index+'][\'method_\'+'+parent_parent_index+'] = data[0].url;inputObj['+parent_parent_index+'][\'id\'] = '+parent_parent_index+' "  </td>' +
            '<td><input type = "text" ng-model="inputObj['+parent_parent_index+'][\'type_\'+'+parent_parent_index+']" ng-init=" inputObj['+parent_parent_index+'][\'type_\'+'+parent_parent_index+'] = data[0].url;inputObj['+parent_parent_index+'][\'id\'] = '+parent_parent_index+' "  </td>' +
            '<td class="last_td_'+parent_parent_index+'"><input type = "text" ng-model="inputObj['+parent_parent_index+'][\'async_\'+'+parent_parent_index+']" ng-init=" inputObj['+parent_parent_index+'][\'async_\'+'+parent_parent_index+'] = data[0].url;inputObj['+parent_parent_index+'][\'id\'] = '+parent_parent_index+' "  </td>' +
            '<td> <div class="datas_div inputs_div_'+parent_parent_index+'">' +
            '<p> <input type = "text" ng-model="inputObj['+parent_parent_index+'].data[0][\'key\']"  />'+
            '<span>  : </span>'+
            '<input type = "text" ng-model="inputObj['+parent_parent_index+'].data[0][\'value\']"  /> </p>' +
            '<button class="add_input" ng-click="addFields($event, null)">add more fields</button>' +
            '</div> </td>' +
            ' <td>{{status ['+parent_parent_index+']}}</td>' +
            ' <td>{{statusText ['+parent_parent_index+']}}' +
            '<br/>'+
            '<span class="see_more"  ng-click="seeResponse('+parent_parent_index+')" ng-show="statusText ['+parent_parent_index+']" ng-class="{\'red\':(statusText ['+parent_parent_index+']!=\'OK\')}">see more</span>' +
            '</td></tr>')($scope);
        angular.element(".table_main_request").append(newEle);

        var div_length = angular.element(".inputs_div_"+parent_parent_index+"").length;
        var inputs_length = angular.element(".inputs_div_"+parent_parent_index+"").find("input").length;

        // console.log("input1 ", $scope.inputObj, "input lengts", inputs_length,"div_length",div_length);

        angular.forEach($scope.inputObj, function (value, key) {
            // console.log("value", value, "key", key)
        });
        $scope.lengtNgRepeat++;
        // console.log("$scope.lengtNgRepeat",$scope.lengtNgRepeat);
        // console.log("$scope.parent_parent_index", parent_parent_index);
    };

$scope.addFields= function ($event, parent_index) {
    // console.log("$scope.lengtNgRepeat",$scope.lengtNgRepeat);

    var par_index = parent_index!=null ? parent_index : $scope.lengtNgRepeat-1;
    // console.log("par_index", par_index);

    var element = angular.element($event.currentTarget);
    var elementLengt = angular.element(element[0].parentElement).find("p").length;
    var newFields = $compile ('<p><input type = "text" ng-model="inputObj['+par_index+'].data['+elementLengt+'][\'key\']" ng-init="inputObj['+par_index+'].data['+elementLengt+'][\'key\'] = key"/>'+
    '<span>  : </span>'+
    '<input type = "text" ng-model="inputObj['+par_index+'].data['+elementLengt+'][\'value\']" ng-init="inputObj['+par_index+'].data['+elementLengt+'][\'value\'] = value"/></p>')($scope);
    element.before(newFields);

};
    $scope.selected = [];
    $scope.updateSelection = function ($event, index, all) {
        // console.log("$scope.inputObj",$scope.inputObj);
        // console.log("index", index,"all",all);
        if (all == undefined) {
            var checkbox = $event.currentTarget;
            var action = checkbox.checked ? 'add' : 'remove';
            if (action == 'add') {
                if ($scope.selected.length > 0) {
                    var isExisit = false;
                    angular.forEach($scope.selected, function (value, key) {
                        // console.log("value,id", value.id);
                        if (value.id == index) {
                            isExisit = true;
                        }
                    });
                    if (isExisit == false) {

                        $scope.selected.push($scope.inputObj[index]);
                    }
                }
                else {
                    // console.log("$scope.inputObj[index]",$scope.inputObj[index])
                    $scope.selected.push($scope.inputObj[index]);
                }
            }
            if (action == 'remove' ) {
                angular.forEach($scope.selected, function (value, key) {
                    if (value.id == index) {
                        $scope.selected.splice($scope.selected.indexOf(value), 1);
                    }
                });

            }
        }
        else {
            // console.log("mtav all");
            $scope.selected = [];
            var checkbox = $event.currentTarget;
            var action = checkbox.checked ? 'add' : 'remove';
            if (action == 'add') {
                angular.forEach($scope.inputObj, function (value, key) {
                    $scope.selected.push(value)
                })
            }
            if (action == 'remove') {
                $scope.selected = [];
            }

        }
        // console.log("$scope.selected", $scope.selected)
    };


    $scope.send_request = function () {

        for(var i = 0; i < $scope.requestCount; i++) {
            // console.log("$scope.requestCount",$scope.requestCount)
            $scope.status = {};
            $scope.statusText = {};
            $scope.responseData = {};
            if ($scope.selected) {
                angular.forEach($scope.selected, function (firtsValue, firstKey) {

                    var url_path = firtsValue['url_' + firtsValue.id];
                    var method = firtsValue['method_' + firtsValue.id];
                    var async = firtsValue['async_' + firtsValue.id];
                    var id = firtsValue.id;
                    // console.log("firtsValue", firtsValue, "firtsKey", firstKey);

                    if (firtsValue.data) {
                        var dataSend = {};
                        angular.forEach(firtsValue.data, function (secondValue, secondKey) {
                            // console.log("secondValue", secondValue, "secondKey", secondKey);
                            if (secondValue) {
                                angular.forEach(secondValue, function (thirdValue, thirdKey) {
                                    // console.log("thirdValue", thirdValue, "thirdKey", thirdKey);
                                    dataSend[secondValue.key] = secondValue.value;
                                })
                            }

                        })
                    }

                    // console.log("url", url_path, "method", method, "data", dataSend);

                    var req = {
                        method: method,
                        url: url_path,
                        async: async,
                        headers: {
                            'Content-Type': undefined
                        },
                        data: dataSend
                    };
                    $http(req).then(
                        function (data) {
                            // console.log("data successic", data);
                            $scope.status[id] = data.status;

                            $scope.statusText[id] = data.statusText;
                            $scope.responseData[id] = data.data;
                            // console.log("$scope.statusSuccess", $scope.responseData)
                        },
                        function (data) {
                            // console.log("data erroric", data);
                            $scope.status[id] = data.status;
                            $scope.statusText[id] = data.statusText;
                            $scope.responseData[id] = data.data;

                        })
                })
            }
        }
    };

    $scope.closeInfoResponse = function () {
        $scope.createInfoResponse = false;

        // console.log("$scope.createInfoResponse",$scope.createInfoResponse)
    };

    $scope.seeResponse = function (id) {
        // console.log("$scope.responseData",$scope.responseData[id],"scope.responseData type",typeof($scope.responseData[id]) );

        var infoFromResponse = $compile('<div ng-if="createInfoResponse" class="info_data">' +
            '<div class="close_buuton_div"> <button ng-click="closeInfoResponse()">Close</button>' +
            '<div style="clear: both"></div>' +
            '</div> ' +
            '<div class="info_data_parent">' +
            '<h2>' +
            'Data from server' +
            '</h2>' +
            '<p class="infoResponsePre" ng-if="responseData['+id+'].toLowerCase" ng-bind-html="responseData['+id+']">  ' +
            '</p>' +
            '<pre class="infoResponsePre" ng-if="!responseData['+id+'].toLowerCase" >  ' +
            '{{responseData['+id+'] |  json : 4 }}' +
            '</pre>' +
            '</div></div>')($scope);


        angular.element("body").append(infoFromResponse);
        $scope.createInfoResponse = true;





    }


}]);