// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require sync

var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

Sync.UserListRow = (function(superClass) {
  extend(UserListRow, superClass);

  function UserListRow() {
    return UserListRow.__super__.constructor.apply(this, arguments);
  }

  UserListRow.prototype.beforeUpdate = function(html, data) {
    return this.$el.fadeOut('slow', (function(_this) {
      return function() {
        return _this.update(html);
      };
    })(this));
  };

  UserListRow.prototype.afterUpdate = function() {
    return this.$el.fadeIn('slow');
  };

  UserListRow.prototype.beforeRemove = function() {
    return this.$el.fadeOut('slow', (function(_this) {
      return function() {
        return _this.remove();
      };
    })(this));
  };

  return UserListRow;

})(Sync.View);
