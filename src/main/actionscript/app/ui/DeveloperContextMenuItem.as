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

package app.ui {
import flash.events.ContextMenuEvent;

import hu.vpmedia.net.utils.WindowTarget;
import hu.vpmedia.ui.BaseContextMenuItem;
import hu.vpmedia.utils.NetUtil;

/**
 * Class
 * @author Andras Csizmadia
 */
public class DeveloperContextMenuItem extends BaseContextMenuItem {
    /**
     * Constructor
     */
    public function DeveloperContextMenuItem() {
        title = "Developed by VPMedia.eu";
        super();
        content.separatorBefore = true;
    }

    //----------------------------------
    //  Bootstrap
    //----------------------------------

    /**
     * Context menu event handler
     * @param event ContextMenuEvent
     */
    override protected function eventHandler(event:ContextMenuEvent):void {
        var url:String = "http://www.vpmedia.eu";
        NetUtil.getURL(url, WindowTarget.BLANK);
    }

}

}
