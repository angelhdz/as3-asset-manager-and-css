package  {

  import flash.text.TextField;
  import flash.net.URLLoader;
  import flash.text.StyleSheet;
  import flash.net.URLRequest;
  import flash.events.Event;

  public class EditView extends WidgetView {
  
    private var _cssStylesheet: StyleSheet = new StyleSheet();
    private var _htmlTextField: TextField = new TextField();


    public function EditView() {
      super();
      trace("Beginning EditView Class Constructor, this: " + this);

      _htmlTextField.htmlText = '<p align="left"><b><font color="#FF0000" size="12" face="Verdana, Arial, Helvetica, sans-serif">Text from EditView</font></b></p>';
      _htmlTextField.width = 400;
      addChild(_htmlTextField);
      
      AssetManager.add('css/css.css');
      AssetManager.add('txt/html.txt');
      AssetManager.load(_loadComplete);
    }

    private function _loadComplete():void {
      trace('All files loaded. Assets ready.');
      trace(AssetManager.get('css/css.css'));
      trace(AssetManager.get('txt/html.txt'));
      const cssStylesheetData:String = AssetManager.get('css/css.css');
      _cssStylesheet.parseCSS(cssStylesheetData);
      _htmlTextField.styleSheet = _cssStylesheet;
      _htmlTextField.htmlText = AssetManager.get('txt/html.txt');
    }
  }
}