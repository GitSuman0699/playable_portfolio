// EmailJS Integration - Custom JavaScript
// This file handles email sending via EmailJS API to bypass Dart package conflicts

// EmailJS Configuration
// TODO: Replace these with your actual EmailJS credentials from https://www.emailjs.com/
const EMAILJS_CONFIG = {
    serviceId: 'YOUR_SERVICE_ID',
    templateId: 'YOUR_TEMPLATE_ID',
    publicKey: 'YOUR_PUBLIC_KEY'
};

// Rate limiting configuration
const RATE_LIMIT_KEY = 'portfolio_last_email_sent';
const COOLDOWN_HOURS = 24;

/**
 * Check if user is within cooldown period
 * @returns {Object} { isLimited: boolean, hoursRemaining: number }
 */
function checkRateLimit() {
    try {
        const lastSentStr = localStorage.getItem(RATE_LIMIT_KEY);

        if (!lastSentStr) {
            return { isLimited: false, hoursRemaining: 0 };
        }

        const lastSent = new Date(lastSentStr);
        const now = new Date();
        const hoursDiff = (now - lastSent) / (1000 * 60 * 60);

        if (hoursDiff < COOLDOWN_HOURS) {
            const hoursRemaining = Math.ceil(COOLDOWN_HOURS - hoursDiff);
            return { isLimited: true, hoursRemaining };
        }

        return { isLimited: false, hoursRemaining: 0 };
    } catch (e) {
        console.error('Rate limit check failed:', e);
        return { isLimited: false, hoursRemaining: 0 };
    }
}

/**
 * Set rate limit timestamp
 */
function setRateLimit() {
    try {
        localStorage.setItem(RATE_LIMIT_KEY, new Date().toISOString());
    } catch (e) {
        console.error('Failed to set rate limit:', e);
    }
}

/**
 * Send email via EmailJS
 * @param {Object} formData - { name, email, message }
 * @returns {Promise<Object>} { success: boolean, message: string }
 */
async function sendEmail(formData) {
    try {
        // Check rate limit
        const rateLimit = checkRateLimit();
        if (rateLimit.isLimited) {
            return {
                success: false,
                message: `⏱ You've already sent a message. Please wait ${rateLimit.hoursRemaining}h before sending another.`
            };
        }

        // Prepare EmailJS request
        const emailData = {
            service_id: EMAILJS_CONFIG.serviceId,
            template_id: EMAILJS_CONFIG.templateId,
            user_id: EMAILJS_CONFIG.publicKey,
            template_params: {
                from_name: formData.name,
                from_email: formData.email,
                message: formData.message,
                to_email: 'shranp75@gmail.com'
            }
        };

        // Send request to EmailJS
        const response = await fetch('https://api.emailjs.com/api/v1.0/email/send', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(emailData)
        });

        if (response.ok) {
            // Set rate limit on success
            setRateLimit();

            return {
                success: true,
                message: '✓ Message sent successfully! I\'ll get back to you soon.'
            };
        } else {
            throw new Error('Failed to send email');
        }
    } catch (error) {
        console.error('Email sending error:', error);
        return {
            success: false,
            message: '✗ Failed to send message. Please try again or email me directly.'
        };
    }
}

// Expose functions to Dart via window object
window.portfolioEmailJS = {
    checkRateLimit,
    sendEmail
};
