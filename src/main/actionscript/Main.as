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

package {
import app.starling.StarlingApplicationContext;

import com.docmet.core.StarlingApplication;
import com.docmet.core.StarlingApplicationConfig;

/**
 * Main Entry Point
 */
public class Main extends StarlingApplication {

    /**
     * TBD
     */
    private static var config:StarlingApplicationConfig = new StarlingApplicationConfig();

    //----------------------------------
    //  Constructor
    //----------------------------------

    /**
     * Constructor
     */
    public function Main() {
        //config.NativeContextClass = ApplicationContext;
        ContextClass = StarlingApplicationContext;
        config.showStats = true;
        config.isFluidStage = false;
        super(VIEWPORT::WIDTH, VIEWPORT::HEIGHT, config);
    }

    // EOC

}

//EOP

}
