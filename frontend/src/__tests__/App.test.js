import { render, screen } from '@testing-library/react';
import '@testing-library/jest-dom';
import App from '../App';

test('renders the app component', () => {
  render(<App />);
  const linkElement = screen.getByText(/welcome to business socials/i);
  expect(linkElement).toBeInTheDocument();
});