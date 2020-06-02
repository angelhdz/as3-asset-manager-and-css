package
{
  import flash.net.URLLoader;
  import flash.net.URLRequest;
  import flash.events.Event;

  public class AssetManager {
    private static var _files:Array = [];
    private static var _assets:Object = {};
    private static var _complete:Function;

    public static function add(file:String):void {
      _files.push(file);
    }

    public static function get(file:String):* {
      return _assets[file].data;
    }

    public static function load(complete:Function):void {
      _complete = complete;
      _enqueue();
    }

    private static function _enqueue():void
    {
      if (_files.length > 0) {
        var loader:URLLoader = new URLLoader();
        loader.addEventListener(Event.COMPLETE, _fileLoaded);
        loader.load(new URLRequest(_files[0]));
      } else {
        if (_complete !== null && _complete is Function) _complete();
      }
    }

    private static function _fileLoaded(event:Event): void {
      var loader:URLLoader = event.target as URLLoader;
      _assets[_files[0]] = {url: _files[0], data: loader.data};
      _files.splice(0, 1);
      _enqueue();
    }
  }
}