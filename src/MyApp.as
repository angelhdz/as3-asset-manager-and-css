package
{
	import flash.display.Sprite;

	public class MyApp extends Sprite
	{
		public function MyApp()
		{
      super();
      stage.align = 'topLeft';
      
		  const view:EditView = new EditView();
      addChild(view);
		}
	}
}