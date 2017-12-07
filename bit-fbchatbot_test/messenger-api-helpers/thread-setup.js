// ===== MESSENGER =============================================================
import messages from './messages';
import api from './api';

/**
 * setGetStarted - Sets the Get Started button for the application
 *
 * @returns {undefined}
 */
const setGetStarted = () => {
  api.callThreadAPI(messages.getStarted);
};

export default {setGetStarted};
