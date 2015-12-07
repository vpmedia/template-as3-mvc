/*
 * =BEGIN CLOSED LICENSE
 *
 *  Copyright(c) 2014 Andras Csizmadia.
 *  http://www.vpmedia.eu
 *
 *  For information about the licensing and copyright please
 *  contact Andras Csizmadia at andras@vpmedia.eu.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 *  THE SOFTWARE.
 *
 * =END CLOSED LICENSE
 */

package app.flash
{
    import app.core.ApplicationModel;
    
    import hu.vpmedia.mvc.BaseMediator;
    import hu.vpmedia.mvc.IBaseView;

    /**
     * @inheritDoc
     */
    public class @TEMPLATE@Mediator extends BaseMediator
    {        
        /**
         * Constructor
         * @param view IBaseView
         */
        public function @TEMPLATE@Mediator(view:IBaseView)
        {
            super(view);
        }
        
        /**
         * @inheritDoc
         */
        override protected function initialize():void
        {
        }
        
        /**
         * @inheritDoc
         */
        override public function dispose():void
        {
            super.dispose();
        }
        
        /**
         * @public
         */
        public function get view():@TEMPLATE@View
        {
            return @TEMPLATE@View(_view);
        }
        
        /**
         * @public
         */
        public function get controller():@TEMPLATE@Controller
        {
            return @TEMPLATE@Controller(_view.controller);
        }
        
        /**
         * @public
         */
        public function get model():ApplicationModel
        {
            return ApplicationModel(_view.model);
        }
    }
}
