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
    
    import hu.vpmedia.mvc.BaseController;
    import hu.vpmedia.mvc.BaseModel;
    import hu.vpmedia.mvc.IBaseView;

    /**
     * @inheritDoc
     */
    public class @TEMPLATE@Controller extends BaseController
    {
        /**
         * Constructor
         * @param view BaseView
         * @param model BaseModel
         */
        public function @TEMPLATE@Controller(view:IBaseView, model:BaseModel)
        {
            super(view, model);
        }

        //----------------------------------
        //  Bootstrap
        //----------------------------------

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
        }

        //----------------------------------
        //  Getters
        //----------------------------------

        /**
         * @private
         */
        private function get viewContext():@TEMPLATE@View
        {
            return @TEMPLATE@View(_view);
        }
        
        /**
         * @private
         */
        private function get appModel():ApplicationModel
        {
            return ApplicationModel(_model);
        }

        //----------------------------------
        //  Event Handlers
        //----------------------------------

        // EOC
    }

    // EOP    
}

